#!/usr/bin/env python3
"""
キャラクター設定検証スクリプト
YAMLファイルの構造と必須フィールドをチェック
"""

import yaml
import argparse
import sys
from pathlib import Path

REQUIRED_FIELDS = {
    'character': {
        'name': str,
        'description': str,
        'role': str,
        'emoji': str
    },
    'personality': {
        'traits': list,
        'strengths': list,
        'communication_style': {
            'tone': str,
            'approach': str,
            'catchphrase': str
        }
    },
    'speech_patterns': {
        'opening': list,
        'analysis': list,
        'uncertainty': list
    },
    'work_style': {
        'focus_areas': list,
        'decision_process': list
    }
}

def validate_structure(data, required, path=""):
    """再帰的に構造を検証"""
    errors = []
    
    for key, expected_type in required.items():
        current_path = f"{path}.{key}" if path else key
        
        if key not in data:
            errors.append(f"Missing required field: {current_path}")
            continue
            
        if isinstance(expected_type, dict):
            # ネストされた構造の検証
            if not isinstance(data[key], dict):
                errors.append(f"Field {current_path} should be a dictionary")
            else:
                errors.extend(validate_structure(data[key], expected_type, current_path))
        elif isinstance(expected_type, type):
            # 型の検証
            if not isinstance(data[key], expected_type):
                errors.append(f"Field {current_path} should be of type {expected_type.__name__}")
            elif expected_type == list and len(data[key]) == 0:
                errors.append(f"Field {current_path} should not be empty")
                
    return errors

def validate_character_file(file_path):
    """キャラクターファイルを検証"""
    try:
        with open(file_path, 'r', encoding='utf-8') as f:
            data = yaml.safe_load(f)
    except Exception as e:
        return False, [f"Failed to load YAML file: {e}"]
    
    # 構造検証
    errors = validate_structure(data, REQUIRED_FIELDS)
    
    # 追加の検証
    if 'character' in data and 'name' in data['character']:
        name = data['character']['name']
        if len(name) > 20:
            errors.append("Character name should be 20 characters or less")
    
    if 'personality' in data and 'traits' in data['personality']:
        if len(data['personality']['traits']) < 3:
            errors.append("At least 3 personality traits should be defined")
    
    return len(errors) == 0, errors

def main():
    parser = argparse.ArgumentParser(description='キャラクター設定ファイルの検証')
    parser.add_argument('--team', required=True, help='チーム名')
    parser.add_argument('--character', required=True, help='キャラクター名')
    parser.add_argument('--file', help='直接ファイルパスを指定（オプション）')
    
    args = parser.parse_args()
    
    if args.file:
        file_path = Path(args.file)
    else:
        file_path = Path(f"../requirements-engineering-multiagent/templates/character-configs/{args.team}/{args.character}.yaml")
    
    if not file_path.exists():
        print(f"❌ ファイルが見つかりません: {file_path}")
        return 1
    
    print(f"🔍 検証中: {file_path}")
    
    is_valid, errors = validate_character_file(file_path)
    
    if is_valid:
        print(f"✅ {args.character} の設定は有効です")
        return 0
    else:
        print(f"❌ {args.character} の設定にエラーがあります:")
        for error in errors:
            print(f"  - {error}")
        return 1

if __name__ == "__main__":
    sys.exit(main())