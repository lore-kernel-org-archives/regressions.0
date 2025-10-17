Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FFA6296BBA
	for <regressions@lists.linux.dev>; Fri, 17 Oct 2025 16:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760718105; cv=none; b=YZTEF67SRdo+1WeBt+JlTc/+dZn62WG6QRfkNzZwMoBvcJh2l1PocwEoSFzbIU0CmuRG8s5oeEVhHcQCuR3ySkJrPqSyx09XsoV4K6DJrUrw1hRw1VVxnZm1nXp7eO+avohUGeiCYvhb/tE19ngG91PM1HrG3+WLVcXUuIDCO+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760718105; c=relaxed/simple;
	bh=RRTwAZLk/2qwdrsLFWGGbVFAHrlDdK2F4Drz9CQFSks=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=V0rd0rwNyrlnZk4ykg5TmzmQz/2jQeEmt36WcgWB8a1wTAOmqZSgZQt8GCrUW34/wL4rECPyFO6fOlpKEFc6IwTYXNClMWQ3xJHFJaBK6vTKfxi/sEGBtyBdY6IZJ98zstLnvvLIIjwjQ8d5sAosACE8UrIKdFdeXYAfYXBCe+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=LjJoAxXp; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="LjJoAxXp"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 735B31A1486;
	Fri, 17 Oct 2025 16:21:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 439F4606DB;
	Fri, 17 Oct 2025 16:21:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 01A30102F2326;
	Fri, 17 Oct 2025 18:21:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760718100; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=M92WI+PGFdvoEo5x/+VF/yQMrWADVhb1nigV4QXWseo=;
	b=LjJoAxXpFtx6zaAAFyn0jnPHV3jwcS75RTNQnQL3aSoDj+iA6M0I9VAo4P4cX9+vv6t2mX
	sGRWUlywn6/2wGFoIxFhaU2SJ2Up7Sw+t0yF9IsNRkbmOsKKHqkXydQDPtuQT2lzbzrJUW
	LLur9aDt+drjnUsk28si/PDdwcMHgJO0mQ9ekTEq00L2TlD2iRUZg1HiJ91lyrJNwpo4v0
	zUoEB/Kfhh8MdhzzgCSWiwGKNcF8EboAAk29M9jQCljnY4BwiGwd/36r/F38tVM8Hn33aj
	VQ9/1jeFuf/XHTBgVIhAycea1PnNZGDOu/cg/HUwfsVc23iqgSwG6u8rOWTRhg==
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 17 Oct 2025 18:21:35 +0200
Message-Id: <DDKQH2MIHZ2S.2MPJCNHXMIT4U@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>, "Naresh Kamboju"
 <naresh.kamboju@linaro.org>, <dri-devel@lists.freedesktop.org>, "open list"
 <linux-kernel@vger.kernel.org>, <lkft-triage@lists.linaro.org>, "Linux
 Regressions" <regressions@lists.linux.dev>
Cc: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Simona Vetter"
 <simona@ffwll.ch>, "David Airlie" <airlied@gmail.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Arnd Bergmann" <arnd@arndb.de>, "Dan Carpenter"
 <dan.carpenter@linaro.org>, "Anders Roxell" <anders.roxell@linaro.org>,
 "Ben Copeland" <benjamin.copeland@linaro.org>
Subject: Re: next-20251014: Internal error: Oops:
 drm_bridge_connector_hdmi_cec_init drmm_connector_hdmi_cec_register
X-Mailer: aerc 0.20.1
References: <CA+G9fYuKHp3QgPKjgFY3TfkDdh5Vf=Ae5pCW+eU41Bu=D7th2g@mail.gmail.com> <CA+G9fYv_mGoDzFv33v7Y5+6yz6z=xp9FJRiFUBYDapvE_rrBXA@mail.gmail.com> <DDJSBQRQJTMZ.X1W4I5YOURPK@bootlin.com>
In-Reply-To: <DDJSBQRQJTMZ.X1W4I5YOURPK@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

Hello,

On Thu Oct 16, 2025 at 3:36 PM CEST, Luca Ceresoli wrote:
> Hello Naresh,
>
> On Thu Oct 16, 2025 at 12:52 PM CEST, Naresh Kamboju wrote:
>> On Thu, 16 Oct 2025 at 16:14, Naresh Kamboju <naresh.kamboju@linaro.org>=
 wrote:
>>>
>>> While booting and loading kernel modules on dragonboard 410c board
>>> with Linux next
>>> kernel next-20251014 and next-20251015 the following crash noticed,
>>>
>>> First seen on next-20251014
>>> Good: next-20251013
>>> Bad:  next-20251014
>>>
>>> Regression Analysis:
>>> - New regression? yes
>>> - Reproducibility? yes
>>>
>>> Boot regressions: next-20251014: Internal error: Oops:
>>> drm_bridge_connector_hdmi_cec_init drmm_connector_hdmi_cec_register
>
> Thanks for the report.
>
> This looks like the same issue reported here:
> https://lore.kernel.org/all/336fbfdd-c424-490e-b5d1-8ee84043dc80@samsung.=
com/
>
> I'm writing a fix right now, will send it today if all goes well.

Here's the fixed version:
https://lore.kernel.org/lkml/20251017-drm-bridge-alloc-getput-bridge-connec=
tor-fix-hdmi_cec-v2-0-667abf6d47c0@bootlin.com/

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
