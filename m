Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9981DFFB
	for <regressions@lists.linux.dev>; Fri, 28 Jun 2024 15:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719588831; cv=none; b=ATklZpK1MOVXlBXvp1sVIWWFebJ9wpA6ghX0hFgosas6M0I6C06L1RUkdbKZxgTsq0eVUnl4n4sskOPSAitt/ejRbaL4iUe/enFQ9+XCFnu8R3yJ7gtwCRg5UqSGEFKR63+o5njP2dGaBfCP0ZpnpTBlTY6RdtksSkVDG58BVxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719588831; c=relaxed/simple;
	bh=UGraYYRshWDZ/TSwoFBJ1oL9VD2hT5teuU1cfPnh0zQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=tA9kRFErQLBiAj4G6UoQInW8cpNyZz9XKLv+sc43P6YCeDMG7Tg95VSbUi0nz+O43wQj5e5QVY3GXQf4/B58y41C4gJ5AaKo0oT6wPBtTf4vy3PFW9NQS7ZLwnhc3paazk1llw4ddtnRLfV3a1GpMJx4RwP6Rx0srMnDVpb8QHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=UBlyLmFW; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="UBlyLmFW"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=UGraYYRshWDZ/TSwoFBJ1oL9VD2hT5teuU1cfPnh0zQ=; t=1719588829;
	x=1720020829; b=UBlyLmFWjl9yw53RSg0ek51+R0HPEo+Sub2n8S2K4Powdw5eEyPeKoCojHjhw
	Q3pAXOOpN+eTEP/5QYGh89u12D4isAaWbOh2F1CFajZwR7J3f+do7NnaKFJohns/tZf3F107YKFVe
	Qzmrt3fjI2DQ51bVHERKu0Dkq6DlVEvc2ivV6LnkpJuhBPXoHvVGbwP+nNxQrEeGsebqKmQm3qirA
	8exvkZUqxv08UCFOiM5pwLtlt3gfd2KsucCCrgD+98QwjOh7I0UO2xMg0nZTI1Uyt9YIEp9JUIKOj
	aAJx5zxYtcy64L1vNAe1N4zIg7zdw/gkr5qzqjGoEo90RKUkQA==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sNDbZ-0005Tp-Ux; Fri, 28 Jun 2024 17:33:42 +0200
Message-ID: <fe92af6e-438b-4c92-a16b-8a89dd751404@leemhuis.info>
Date: Fri, 28 Jun 2024 17:33:41 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Thread for updating minor properties of tracked regressions
 [consider ignoring it!]
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: Linux kernel regressions list <regressions@lists.linux.dev>
References: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Language: en-US, de-DE
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1719588829;31cfa557;
X-HE-SMSGID: 1sNDbZ-0005Tp-Ux



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/a57e9a39-13ce-4e4d-a7a1-c591f6b4ac65@ans.pl/
#regzbot introduced: caba40ec3531b0849
#regzbot summary: eeprom: at24: "sysfs: cannot create duplicate
filename" and i2c registration errors

#regzbot report:
https://lore.kernel.org/all/5792762.DvuYhMxLoT@devpool47.emlix.com/
#regzbot introduced: b1992c3772
#regzbot summary: kbuild: "make xconfig" fails with "No rule to make
target …/qconf-moc.cc …"

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=218707
#regzbot dup:
https://lore.kernel.org/all/IdYcxU6x6xuUqUg8cliJUnucfwfTO29TrKIlLGCCYbbIr1EQnP0ZAtTxdAM2hp5e5Gny_acIN3OFDS6v0sazocnZZ1UBaINEJ0HoDnbasSI%3D@protonmail.com/
