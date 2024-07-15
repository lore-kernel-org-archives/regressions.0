Received: from mx.manguebit.com (mx.manguebit.com [167.235.159.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD13418C335
	for <regressions@lists.linux.dev>; Mon, 15 Jul 2024 14:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=167.235.159.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721053506; cv=pass; b=qiwphrJBTy03rznDCJAf+f0QoCesW0eon0Fhja63AJqdwYcs6lisbBfqvfUVCvZGbX9bJ2++J3otsOWglYZGUZZEnV36mL92U2p8QkZwFcmzoR8B8LIWaDc540xYgTgrt5DiqsbQGgXpXV/NqgxT13gYwT38MDmV4xGWWJJx1AE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721053506; c=relaxed/simple;
	bh=e/c6viLZXMzQDrggkaDt7b3UtJWaL6FVCkK5MphGJrQ=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Date:
	 MIME-Version:Content-Type; b=TYHQwS/qEfvgj7EUs3AI3UwtXpE7FBAG/8lT6Wd4FofhlhU5BlmkW0YeKICJM14KaLxliNCdiiFZPdN6Y3iwqq36C3d38m+M4XiwNKWqN/bI1X0YuaEu4vPtmwprDjEqYOLaXDqBjHV5bJ4n3Dxl8OBDN9geOGsIFOez8suP9hQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manguebit.com; spf=pass smtp.mailfrom=manguebit.com; dkim=pass (2048-bit key) header.d=manguebit.com header.i=@manguebit.com header.b=dDve9anL; arc=pass smtp.client-ip=167.235.159.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manguebit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=manguebit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=manguebit.com header.i=@manguebit.com header.b="dDve9anL"
Message-ID: <d978adcf400b3f938eebc4c4d66c754c@manguebit.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manguebit.com;
	s=dkim; t=1721053502;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b3ybVPzSI4vGZE7JpCvLCbbwt31ZuXts/vp62X+TbvI=;
	b=dDve9anLRrGUXyRtFbEc0xgKpPJcfZwvckS97ZaIlwJg1+ltpm+sHUK9ce7MEKXfKcJ32Q
	n4sE89n7nYeFBzUDle7mUADCyzU729xbwdks7IK8sQp3tSI2UMum3EV052YOe+CEuGUtHL
	cR0NpQBoNGKsfmiw3vPvenFx3sXLkZ/VZAKpKy7ywy/Wajd05IOy4ANfJUlpRHmWEHyEqx
	biu8vJ8hl9uq/9QmybsVkKE11qJ9tx5FKSNHg8g4nat6iPXWxkQl0fJ0r4nQJxb5/efbtn
	Q7Cc3yzTiz6ayixb748OBH77Oeg7VRtjPA2rPxtppQcjSxpYQd+OuNCRKwTwHQ==
ARC-Seal: i=1; s=dkim; d=manguebit.com; t=1721053502; a=rsa-sha256;
	cv=none;
	b=hpNIktDC++L9xg0b4ByqJ3u9QHbl8reiJGjLQI1XmYKihVLN9Q4NZ6jC44C38bHQzv0CZB
	0Nq3RmDpSVmHUAfC4zDL2OTGqC9Uhl2AbvN7TI2yORVrOcHQ5XsaRSAAKR77uDB2T6v4CG
	jL8zyoZnbAHH6/1nQzKUO5+kH57TyecuzSstEuZYklbYQXyui5mifaR5ADkokl/W4A7+Qb
	XK97MXZ9Hyq4mwZHpWmy0qH1WB97rxxTQi57uyjn2OWGegMqCkyuoZ7E1thNdZaNqOekJn
	ZOiyHuposDcAnfIzQuQSBVd8n1xdKl0tI9zt+dAgYNIUqdTpjdniR0wNkh+Jlw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.mailfrom=pc@manguebit.com
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=manguebit.com;
	s=dkim; t=1721053502; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b3ybVPzSI4vGZE7JpCvLCbbwt31ZuXts/vp62X+TbvI=;
	b=aO+JIdBr46fdrTrYy6qFIjA9ofEkFH2BdigQGC7+bt6Lj347GF8W6oQul4BnHGVdvgP4ZW
	mkP1aHskzejHUnBYZAtg5TmbV6GSU7b8SRp7KqobHMpuhSLfb2YBjNiaEGgfzsOztEZ/Z7
	p86BGFVh1TQuY8Ikf4E2PCZnrxfRgETU5vTUZe/AjE8u6gjEpvO4F/k4CCtqkRLJuMlozj
	svnq/5v5l+DnFx+7NZRXuJB3AI3d605YXUzasZz5lDcpznbve7KiE1z/GMggk2i5bEAEV2
	09TmnhjOvEcF/TVYZ0zICsyOxD57My0hzDcFi9D1H6F17rj/l2ak+5AY7C9w6Q==
From: Paulo Alcantara <pc@manguebit.com>
To: =?utf-8?Q?Steinbei=C3=9Fer=2C_Sebastian?=
 <Sebastian.Steinbeisser@lrz.de>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: Re: Potential smb/dfs regression introduced in kernel 6.6
In-Reply-To: <bacefa19d08f36755a74a85e9c1d8600223c1944.camel@lrz.de>
References: <dd878fc236840921d3e31944e26694fed941d0c6.camel@lrz.de>
 <f3a02647b6fcb27a70da4c334930ad3c@manguebit.com>
 <9654b28ff276b5b78ffcc3078bd4dd1ccf80ec73.camel@lrz.de>
 <5210f9e7b720dc1d150bd2ebd9f4edadf39685aa.camel@lrz.de>
 <0ff960c2bde0f213cc9b7ef98b993bfb@manguebit.com>
 <00654293b73f861514a9fb61723a8a424be92bc2.camel@lrz.de>
 <505eef55e45f00146321b7de6549ca46@manguebit.com>
 <bacefa19d08f36755a74a85e9c1d8600223c1944.camel@lrz.de>
Date: Mon, 15 Jul 2024 11:24:58 -0300
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Steinbei=C3=9Fer, Sebastian	<Sebastian.Steinbeisser@lrz.de> writes:

> I'll try and get a setup where we can capture non-encrypted traffic.

You can also send the encrypted packets as long as you provide the
necessary the keys to decrypt them.  Check my last email on how to
retrieve such keys.
