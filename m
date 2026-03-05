Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A4C262BD
	for <regressions@lists.linux.dev>; Thu,  5 Mar 2026 15:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.16.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772726348; cv=none; b=UkZ1COC0bi+OaeogNAPjjdPDTZK8Dt0DN01Y9Thp+ya69J4xdemYLSR8c5RfpsDUdNAgg8uJmeyvFgcrfsXRH77vObZoBwBbn/wvGsptJ5jY8d2iNb49Qyv4y1yZ0q5zn3zZGpMrqohq5MlOn4MjKbakKlH8ZOK1lud0oDXsJYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772726348; c=relaxed/simple;
	bh=I1meZNh+BiNepSvnJPVUQy8FDRlcccIhL0PBmHAFLGc=;
	h=From:To:Cc:Subject:Mime-Version:Content-Type:Date:Message-ID:
	 References:In-Reply-To; b=aoSiA12DZ72Ii8Putc5Kd2gxVHjp7EoFx9sdnRA8wPxYt3PaMGlNKbL8jNJ5ZHyFvn43Ah0NF4iORDs9DroaDGcv9AxhaJb0BWG/TTSy7U9DaPuLJDG0cnZJNfbainIZfB3Xa+8QLMQgZL+s/o+/A9+XYQoNbUurxd8qb/L87PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=d5HyHeOO; arc=none smtp.client-ip=54.206.16.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="d5HyHeOO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1772726286;
	bh=I1meZNh+BiNepSvnJPVUQy8FDRlcccIhL0PBmHAFLGc=;
	h=From:To:Subject:Mime-Version:Date:Message-ID;
	b=d5HyHeOO/RQz6ZtAR2tZcsokPXIWE5Qck0u48iFgTLxnvwfZhRa75ChTDQGicuL8R
	 V6I41ECEV0j3IZ8/IqEHCe5YD9O+p64mpibB8rRCHd0ZuFlUO08k9FujnQhbMxdt4/
	 oxjNkqLpL2SWMdSAnD6aUjMPTCNWG6q6w7AhE/h4=
EX-QQ-RecipientCnt: 5
X-QQ-GoodBg: 1
X-QQ-SSF: 00400000000000F0
X-QQ-FEAT: D4aqtcRDiqSHNwC2Dqd2M/t+aQldaspwowpDBZ8q7ts=
X-QQ-BUSINESS-ORIGIN: 2
X-QQ-Originating-IP: BwGsXqMA5ZG3nHuPfj/KtL6UnHVnNSKTWKRz1P2EUAU=
X-QQ-STYLE: 
X-QQ-mid: lv3gz7b-6t1772726284t6d3630ea
From: "=?utf-8?B?V2VudGFvIEd1YW4=?=" <guanwentao@uniontech.com>
To: "=?utf-8?B?VGhvcnN0ZW4gTGVlbWh1aXM=?=" <regressions@leemhuis.info>, "=?utf-8?B?cmVncmVzc2lvbnM=?=" <regressions@lists.linux.dev>
Cc: "=?utf-8?B?c3RhYmxl?=" <stable@vger.kernel.org>, "=?utf-8?B?U2FzaGEgTGV2aW4=?=" <sashal@kernel.org>, "=?utf-8?B?R3JlZyBLSA==?=" <gregkh@linuxfoundation.org>
Subject: Re: [ REGRESSION v6.6.128 ] build failure on x86 because commit 22e460b6333a
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
Date: Thu, 5 Mar 2026 23:58:03 +0800
X-Priority: 3
Message-ID: <tencent_160637F6605A44E80C18F34B@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
References: <tencent_1EDDBDC63EFAE9C27849E987@qq.com>
	<2d32f010-787c-4541-9217-9b08df32b1b9@leemhuis.info>
In-Reply-To: <2d32f010-787c-4541-9217-9b08df32b1b9@leemhuis.info>
X-QQ-ReplyHash: 1334635717
X-BIZMAIL-ID: 3163466203530119632
X-Address-Ticket:version=;type=;ticket_id=;id_list=;display_name=;session_id=;
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1])
	by smtp.qq.com (ESMTP) with SMTP
	id ; Thu, 05 Mar 2026 23:58:05 +0800 (CST)
Feedback-ID: lv:uniontech.com:qybglogicsvrsz:qybglogicsvrsz4b-0
X-QQ-XMAILINFO: MMnP0fEUKo/h/L8WjTyRZK8rhStyKcaJC54Tumc5nSAakt6Ds2xtD+PH
	yLXALkmktUpmHLHZe5oGzDNqukLAIF7jJ/iyFh4HXCipRKyHEf5ntnjFAD4yXKKTo6XWWVk
	JZAagCWxyeKK+01M9J0rRbYkKHunZCACzVux9Gem0RvA0Cij6XU3gXTNzQHCoV977CT2wDR
	/s5uyJoUh9AXUJRX+QJgJ40p6e4mUFeq2OUe40YwLIXdVOSvSlfJ5lVVpjhdtBkSlF9XK9f
	qqE8LpRgt7U6dX5M/X8p2q4nod4Zu1GcH2D6zZvH9c8bfQ2ttGSOQtX98hFpKA25v1Hy7ET
	pvUu38281PKfwXHsKPs9NGSc8VfzQxkF6WhQu7oEluK8JbLIx8XS6ntW0jR3ZRNSA4GlX3B
	wUrjPfPYcC7dBYF1jjLAY6m18aw9GmB0AkBJ0fBA3yky544iJXlQepaoX8JpYrHG9l4Es0t
	j+7lCfdDgjnHbEG9uE3iZbDkaK2ZRomhnsh1GvEhDleFj0szVKEwi+oph7jajUaFA77lTaj
	bbQboDCoRc6ZRZ1rgUA0VTUYcc4zVhaGSSp7aYv1kDjLcdjrJpudaW8nXXQt/SjHGmw94HW
	s5YHwd7CQsJbpXd6x8dTxOF81WmS/CYYaO6zUk+NpqQnwWCKbhS0pvDyNmAbuddsIgQdCok
	m9siL0W0s+BwteABt5Dy1lRicm0gZaAauV+j4OfAI7VOdShxGzEjIQ/k8dzPUYjGWiI38TB
	40/zeyZOmj9awGayZ36jedv4bZZhOLqP53FcRIfTGP2ejIxd1p41lrmXYYys0bIj3syGymB
	+OuW02z+M6T9rF4ZyVOpixo7NkwUnen7HKQs7LN3rF0v42+yKEjkwokRNoVV2cOgPNFwmMk
	yMqJk+IrdCA96JUzc3VguUsAIS1avNmnezWDMz4Zd/13QlZRJyzL0AITzrG/RTT2KzRtNfN
	SrToMOt5xhaA72tK0FaJpeLv+8szVxGpXw1Q7Ronm34pHI19i3sbMURsP7+xqYxgWl3m5qJ
	adgC7maxA8lXAiV4alaxokoxAfaBk=
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0

VGhhbmtzIGZvciB5b3VyIG5vdGljZSwNCkkgdGVzdGVkIHRoZSB2Ni42LjEyOSBhbmQgdjYu
MTIuNzYgd2l0aCBvdXIgY29uZmlnLA0KdGhlIGJ1aWxkIHByb2JsZW0gaGFzIGJlZW4gc29s
dmVkLg0KDQpCUnMNCldlbnRhbyBHdWFu

