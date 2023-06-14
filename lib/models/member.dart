import 'dart:convert';

class Member {
  int? id;
  int? member_id;
  String? first_name;
  String? last_name;
  String? middle_name;
  String? tin_number;
  String? address;
  String? day_of_birth;
  int? age;
  String? gender;
  String? civil_status;
  String? educational_attainment;
  String? occupation;
  String? dependent_number;
  String? religion;
 String? date_accepted;
  int? bod_number;
  String? membership_type;
  int? number_of_shares;
  String? amount_subscribed;
  String? initial_paid_up;
  String? bod_resolution;
 String? date_created_at;
 String? created_at;
 String? updated_at;
  Member({
    this.id,
    this.member_id,
    this.first_name,
    this.last_name,
    this.middle_name,
    this.tin_number,
    this.address,
    this.day_of_birth,
    this.age,
    this.gender,
    this.civil_status,
    this.educational_attainment,
    this.occupation,
    this.dependent_number,
    this.religion,
    this.date_accepted,
    this.bod_number,
    this.membership_type,
    this.number_of_shares,
    this.amount_subscribed,
    this.initial_paid_up,
    this.bod_resolution,
    this.date_created_at,
    this.created_at,
    this.updated_at,
  });
  

  Member copyWith({
    int? id,
    int? member_id,
    String? first_name,
    String? last_name,
    String? middle_name,
    String? tin_number,
    String? address,
    String? day_of_birth,
    int? age,
    String? gender,
    String? civil_status,
    String? educational_attainment,
    String? occupation,
    String? dependent_number,
    String? religion,
    String? date_accepted,
    int? bod_number,
    String? membership_type,
    int? number_of_shares,
    String? amount_subscribed,
    String? initial_paid_up,
    String? bod_resolution,
    String? date_created_at,
    String? created_at,
    String? updated_at,
  }) {
    return Member(
      id: id ?? this.id,
      member_id: member_id ?? this.member_id,
      first_name: first_name ?? this.first_name,
      last_name: last_name ?? this.last_name,
      middle_name: middle_name ?? this.middle_name,
      tin_number: tin_number ?? this.tin_number,
      address: address ?? this.address,
      day_of_birth: day_of_birth ?? this.day_of_birth,
      age: age ?? this.age,
      gender: gender ?? this.gender,
      civil_status: civil_status ?? this.civil_status,
      educational_attainment: educational_attainment ?? this.educational_attainment,
      occupation: occupation ?? this.occupation,
      dependent_number: dependent_number ?? this.dependent_number,
      religion: religion ?? this.religion,
      date_accepted: date_accepted ?? this.date_accepted,
      bod_number: bod_number ?? this.bod_number,
      membership_type: membership_type ?? this.membership_type,
      number_of_shares: number_of_shares ?? this.number_of_shares,
      amount_subscribed: amount_subscribed ?? this.amount_subscribed,
      initial_paid_up: initial_paid_up ?? this.initial_paid_up,
      bod_resolution: bod_resolution ?? this.bod_resolution,
      date_created_at: date_created_at ?? this.date_created_at,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'member_id': member_id,
      'first_name': first_name,
      'last_name': last_name,
      'middle_name': middle_name,
      'tin_number': tin_number,
      'address': address,
      'day_of_birth': day_of_birth,
      'age': age,
      'gender': gender,
      'civil_status': civil_status,
      'educational_attainment': educational_attainment,
      'occupation': occupation,
      'dependent_number': dependent_number,
      'religion': religion,
      'date_accepted': date_accepted,
      'bod_number': bod_number,
      'membership_type': membership_type,
      'number_of_shares': number_of_shares,
      'amount_subscribed': amount_subscribed,
      'initial_paid_up': initial_paid_up,
      'bod_resolution': bod_resolution,
      'date_created_at': date_created_at,
      'created_at': created_at,
      'updated_at': updated_at,
    };
  }

  factory Member.fromMap(Map<String, dynamic> map) {
    return Member(
      id: map['id']?.toInt(),
      member_id: map['member_id']?.toInt(),
      first_name: map['first_name'],
      last_name: map['last_name'],
      middle_name: map['middle_name'],
      tin_number: map['tin_number'],
      address: map['address'],
      day_of_birth: map['day_of_birth'],
      age: map['age']?.toInt(),
      gender: map['gender'],
      civil_status: map['civil_status'],
      educational_attainment: map['educational_attainment'],
      occupation: map['occupation'],
      dependent_number: map['dependent_number'],
      religion: map['religion'],
      date_accepted: map['date_accepted'],
      bod_number: map['bod_number']?.toInt(),
      membership_type: map['membership_type'],
      number_of_shares: map['number_of_shares']?.toInt(),
      amount_subscribed: map['amount_subscribed'],
      initial_paid_up: map['initial_paid_up'],
      bod_resolution: map['bod_resolution'],
      date_created_at: map['date_created_at'],
      created_at: map['created_at'],
      updated_at: map['updated_at'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Member.fromJson(String source) => Member.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Member(id: $id, member_id: $member_id, first_name: $first_name, last_name: $last_name, middle_name: $middle_name, tin_number: $tin_number, address: $address, day_of_birth: $day_of_birth, age: $age, gender: $gender, civil_status: $civil_status, educational_attainment: $educational_attainment, occupation: $occupation, dependent_number: $dependent_number, religion: $religion, date_accepted: $date_accepted, bod_number: $bod_number, membership_type: $membership_type, number_of_shares: $number_of_shares, amount_subscribed: $amount_subscribed, initial_paid_up: $initial_paid_up, bod_resolution: $bod_resolution, date_created_at: $date_created_at, created_at: $created_at, updated_at: $updated_at)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Member &&
      other.id == id &&
      other.member_id == member_id &&
      other.first_name == first_name &&
      other.last_name == last_name &&
      other.middle_name == middle_name &&
      other.tin_number == tin_number &&
      other.address == address &&
      other.day_of_birth == day_of_birth &&
      other.age == age &&
      other.gender == gender &&
      other.civil_status == civil_status &&
      other.educational_attainment == educational_attainment &&
      other.occupation == occupation &&
      other.dependent_number == dependent_number &&
      other.religion == religion &&
      other.date_accepted == date_accepted &&
      other.bod_number == bod_number &&
      other.membership_type == membership_type &&
      other.number_of_shares == number_of_shares &&
      other.amount_subscribed == amount_subscribed &&
      other.initial_paid_up == initial_paid_up &&
      other.bod_resolution == bod_resolution &&
      other.date_created_at == date_created_at &&
      other.created_at == created_at &&
      other.updated_at == updated_at;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      member_id.hashCode ^
      first_name.hashCode ^
      last_name.hashCode ^
      middle_name.hashCode ^
      tin_number.hashCode ^
      address.hashCode ^
      day_of_birth.hashCode ^
      age.hashCode ^
      gender.hashCode ^
      civil_status.hashCode ^
      educational_attainment.hashCode ^
      occupation.hashCode ^
      dependent_number.hashCode ^
      religion.hashCode ^
      date_accepted.hashCode ^
      bod_number.hashCode ^
      membership_type.hashCode ^
      number_of_shares.hashCode ^
      amount_subscribed.hashCode ^
      initial_paid_up.hashCode ^
      bod_resolution.hashCode ^
      date_created_at.hashCode ^
      created_at.hashCode ^
      updated_at.hashCode;
  }
}
