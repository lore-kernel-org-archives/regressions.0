Received: from mail-106117.protonmail.ch (mail-106117.protonmail.ch [79.135.106.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1B331716D
	for <regressions@lists.linux.dev>; Sun,  4 Oct 2026 11:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791111871; cv=none; b=jbRovQyd/1m7ld8N7NI6pMfl9tjtDwia3hhftWlbWXDx/1RBlMjXJK6vNz7w8WxMsvtP/28C5+5IhI+x6aYm80XF/LYFybr2FcjHaPwJWbJEQU2QqNEOCBAIIBzsu3zOMQ3vG8ghBEdJyxXLU/lKliJUJ0zWdhJo7RGss2Xodz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791111871; c=relaxed/simple;
	bh=/rqrMveZALHHpPzPfnXt52M2CU7mcprjFc8ipStbb0s=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BOGW3fl1F2lzjrzvFnzJT/0ERu4w+8/oL29Amqtmk1BGqZv3PgRpg8xkuCYDgcFldqGi0IGDbE6ZHKVfKYc5Pue915OsxT+X00gRHE7WSvJ+dnQHaSFW4D9EEOW4E9n8co/DgX2wynuEUY7cjtBrjMZNceGTkl3w5wSritnP4Yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=saurla.com; spf=pass smtp.mailfrom=saurla.com; dkim=pass (2048-bit key) header.d=saurla.com header.i=@saurla.com header.b=n980oqqc; arc=none smtp.client-ip=79.135.106.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=saurla.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=saurla.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=saurla.com header.i=@saurla.com header.b="n980oqqc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=saurla.com;
	s=protonmail; t=1791111859; x=1791371059;
	bh=/rqrMveZALHHpPzPfnXt52M2CU7mcprjFc8ipStbb0s=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=n980oqqcind/VFG2/LeFBC6XhrnLyv4RJOmKr4qpUjQ8+liu04ZqRrXDHVQOzyfVh
	 jErHGNWfNH++NAjKB3DeN5r/EbFAGHfTaVNktBMtOKWOy5tC0LHWQbA2lwz/hu4pGo
	 Ck0a/dV0UFi3qH67rba8wV6yJHkUVJw3laqtlDERgIXuP1EA5FqRgrDRBXNbdy/Ozm
	 ISI7rhEzwu7L4eetxfw9lLWTN12w9Dt+toPT3yg8o0KKDiei4J1Ec4ErAJC2/bNkvK
	 pEPzjqS2t37uvWfoXd69bArml5567ymS2xweRbv1aNPd1+NmyRwJyYR0H+2Mj7179R
	 JHKSdaHKC37mA==
Date: Sun, 04 Oct 2026 11:04:17 +0000
To: Frantisek Musil <lister@gamesplit.cz>
From: Lauri Saurus <saurla@saurla.com>
Cc: regressions@lists.linux.dev, jkosina@suse.com, jikos@kernel.org
Subject: Re: [REGRESSION] HID: logitech-hidpp: commit f0866517be93 breaks hi-res wheel scrolling over Lightspeed receiver (G903)
Message-ID: <0IXbR44wf-idjlLSV2kHpzPm88Rs_orpaG-CJumHqfydxGdMNnuobRi0Oz8lW2cdpibztLCb1HK2MpcAw3lgsCzSmugEbQBf70Zjooz6ZLY=@saurla.com>
In-Reply-To: <77888c45-0b12-4973-a9c8-9aa5d70eb1b5@gamesplit.cz>
References: <9950dea5-ccff-4ca1-a7ab-98e2b494a284@gamesplit.cz> <77888c45-0b12-4973-a9c8-9aa5d70eb1b5@gamesplit.cz>
Feedback-ID: 198286868:user:proton
X-Pm-Message-ID: d59e9fe4620b863d5256e0adcc2af9e802dd619f
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi.

Thanks for reporting this. I could take a look at the issue. Unfortunately =
I do not have the Logitech G903 LIGHTSPEED mouse, so I cannot reproduce the=
 issue myself.

Could you provide me debug logs from the hid_logitech_hidpp driver when thi=
s issue happens? I propose following steps:

1. Shutdown Solaar (not just the GUI but the whole process)
2. Enable driver debug logging: sudo sh -c 'echo "module hid_logitech_hidpp=
 +p" > /sys/kernel/debug/dynamic_debug/control'
3. Unplug the lightspeed receiver
4. Open terminal to monitor the journalctl: sudo journalctl -kf
5. Plug the lightspeed receiver. Is the mouse now working with high resolut=
ion scroll enabled or not? Copy the journalctl log from the monitoring term=
inal until this point and attach in the response.
6. Start Solaar. Is the mouse scroll working now? Copy the journalctl log f=
rom the monitoring terminal until this point and attach in the response.
7. Apply low resolution scrolling from Solaar. Is the mouse scroll working =
now? Copy the journalctl log from the monitoring terminal until this point =
and attach in the response.
8. Apply high resolution scrolling from Solaar. Is the mouse scroll working=
 now? Copy the journalctl log from the monitoring terminal until this point=
 and attach in the response.

Also please note what is your default value for high resolution scrolling i=
n the Solaar config before running any steps.

If you can provide these logs I'll see if I can make anything out of it.
