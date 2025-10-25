Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B1F2DEA62
	for <regressions@lists.linux.dev>; Sat, 25 Oct 2025 10:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761387083; cv=none; b=GxtmoiJ8rpDL9mQikVjK+SNAb/Jfv9HsTR4PLh+NLvjhlRq9CL9GdLeurOrLAZNex3IYOjFf7gz+xDkdDZkqt5/oTRzNPgrryopGHstjkQ12QG8qCyd8cSZ4NIzjvbo4AKf/XRdDplHiUyVtg/ATtgS0d6GlJ/KoFWDru9Cz07k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761387083; c=relaxed/simple;
	bh=0nttiORIlAvHv5WtRRqjrF4cMesKYVIkYZR+vwF8Z9Q=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TP26syTie7Rp+YY8BH+QYPcvSDzZiFPrYTQQfKO4ejW2AYiglP2sST+ZO+GAFQBVRZQVKU7Rd75eFTh0jeyFWJsvRNqon/jdMRxhhGT5DEWc/emooCn/ajY1rKaC6bZp7K8LYoJlnEWyfWmthAhkf7vtWSuAbsMqknkNqgTr84I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k287PrCP; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k287PrCP"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3ed20bdfdffso2986157f8f.2
        for <regressions@lists.linux.dev>; Sat, 25 Oct 2025 03:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761387080; x=1761991880; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=egj/7WjRwjT6riGuR0koHtTyjN24c/LRgAczk/OnsWw=;
        b=k287PrCPAk8rPd4JTZGlyLHVFaFc6jtZEcX1WJyay6qlAwLj5/tKqXFKLe0VgARCsg
         ilh+Nu80Cmyuo5iJRMYCRAHQozgw2cW5et02klYWx2F07RIB8ehZGPYcby2764WggSMp
         FUZIJRAkrUhb2ZtIUtq098D0VBLakZUYEAhZ0w2a6G2bC6RGCE0du3biar2wyUty72Kj
         hzUVw/aI5REeXF3sgwjo1O80K5cZHYIL6Twju9mrKxGX1c6O+tLrRZucj/y4FJaLySHU
         ApsJO9/UZU0+nLVh0iAd+JKPrk6ZsgQjTSk9RZQIIE3RbaZZmHiznMEy9RNTqIfT0jrn
         +8Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761387080; x=1761991880;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=egj/7WjRwjT6riGuR0koHtTyjN24c/LRgAczk/OnsWw=;
        b=AngygiesZB8oCDlUgvZq0GXn7Z0kqXQgxqZ3vf+eONVQ61JOQNe3rAy7DI2JRk/Hl8
         lBTD7fRaYuPw2DILHcRtlGI7C4bHX/VbnCgy6JJ5/GTExwRWq1yabUgCWJzNzJnWtWHz
         +E324A5ucXJoxJnH6/KL6DB3Fbe3mWaKDiEHUWBTA120w2/n46aGmiHGMMf/N9khJUUV
         YQVHx4mccKYuCVQvZeclt5ZF53Zc83jPwidBQGkxxvaAunF09d94Xu9T8kPLGqhRUsub
         ZoK8aTWigsMRM2fA1tROTwv4BICusn2sHIT3ii4KIDQHc5X7tk0xwbD+twq0rMgxeFhw
         qPBg==
X-Forwarded-Encrypted: i=1; AJvYcCWI1JkI+I5N0Aih6fTPCHVplj3JWBYhSXof/tjPjFhoMGo0lK9SW64ixF3vURu68fLM9+oh8pAJt50qMg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8CGcwjC6KtqFZ382doTNAwn7JfQkBRMtlHRtU4iKyMQWerLn1
	2eFkU1KQiB4xWzkzIMFhhBhUuAAW1tyt2hZXMTFa979rvGmT2CgtYzmZ
X-Gm-Gg: ASbGnctlsZSOagMBPbx9e3ze8uAP6Pkg0xeCgbeBa3DM5hE0PhEyl062ToO7NEVmDmf
	wulmYio3kPZUxL54LhS9SEhiZIPqcd0QHlAd6ey2iGfH1g7L20+YrYbRtzP9J9Tta5xqQGdl9T7
	VngtnmG5gt+EcgDw/eR2MyAIUUlkB7gt9XbRBqORLhVYW6r37frlAnUwpLnl8EDXh7Unpiii4kl
	pCqYXINSTRllVsIY+9Tt2Lpq63jbE+HbbHrON8Nt9TweCLurkdWN4n4fl899XG6RzL7W34cwxu1
	45wZAgUxSH8WIf389b+h8o6+W8lffHWk4WUB7p3vCyYWEOqa6uX1YDd4AHNeVRPAUQD3uJikAFY
	jMpKUa2f+tBy2DtN1RZndMsmnFu5MzdFnKobxa8kL9Ut4X3jhCfQrhKy/5xubFS/hPvCMYJjfrE
	m5v4w4XcEAy3r0VCQV2hHeH6bz3GdH2+ylYFpbyebAbQslPYATPWHdz2C35Q==
X-Google-Smtp-Source: AGHT+IG7ABSr4FtdNNEAo2tbvL9ho+vuY3QRO6VXg6V+Dbe1PORYyrFkPG6pems45nomzqTI2u5v4Q==
X-Received: by 2002:a05:6000:2911:b0:426:d734:1378 with SMTP id ffacd0b85a97d-4299071090fmr4006603f8f.4.1761387079673;
        Sat, 25 Oct 2025 03:11:19 -0700 (PDT)
Received: from ?IPv6:2a02:168:6806:0:c4ec:4cfd:1e64:7a3f? ([2a02:168:6806:0:c4ec:4cfd:1e64:7a3f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952b7b22sm2915027f8f.9.2025.10.25.03.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Oct 2025 03:11:18 -0700 (PDT)
Message-ID: <990fe39da66ad23df4c85ef247b274a0fc6c2336.camel@gmail.com>
Subject: Re: WARNING at drivers/pci/setup-bus.c:2373, bisected to "PCI: Use
 pbus_select_window_for_type() during mem window sizing"
From: Klaus Kudielka <klaus.kudielka@gmail.com>
To: Ilpo =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Date: Sat, 25 Oct 2025 12:11:18 +0200
In-Reply-To: <51e8cf1c62b8318882257d6b5a9de7fdaaecc343.camel@gmail.com>
References: <20250829131113.36754-1-ilpo.jarvinen@linux.intel.com>
		 <20250829131113.36754-20-ilpo.jarvinen@linux.intel.com>
	 <51e8cf1c62b8318882257d6b5a9de7fdaaecc343.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-5 
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Sat, 2025-10-18 at 10:14 +0200, Klaus Kudielka wrote:

[...]


> Device tree: arch/arm/boot/dts/marvell/armada-385-turris-omnia.dts
> PCI driver: pci-mvebu
> Hardware status: The joint mPCIe / mSATA slot carries an mSATA drive, the=
 other
> two mPCIe slots carry WiFi cards.
>=20
> As far as I can tell, hardware is operating nominally, so the warning loo=
ks like
> a false positive.


In the meantime, I stared a bit at the logs, and at the code.


WITH the offending commit, I see TWO identical lines before the WARNING:

> [=C2=A0=C2=A0=C2=A0 0.027107] pci 0000:00:03.0: bridge window [mem 0x0020=
0000-0x003fffff] to [bus 02] add_size 200000 add_align 200000
> [=C2=A0=C2=A0=C2=A0 0.027115] pci 0000:00:03.0: bridge window [mem 0x0020=
0000-0x003fffff] to [bus 02] add_size 200000 add_align 200000

So, this part of  pbus_size_mem() now seems to be called *TWICE* for the sa=
me bridge window:

		add_to_list(realloc_head, bus->self, b_res, size1-size0, add_align);
		pci_info(bus->self, "bridge window %pR to %pR add_size %llx add_align %ll=
x\n",
			   b_res, &bus->busn_res,
			   (unsigned long long) (size1 - size0),
			   (unsigned long long) add_align);



WITHOUT the offending commit, I see only one line, and no WARNING.
> [=C2=A0=C2=A0=C2=A0 0.027405] pci 0000:00:03.0: bridge window [mem 0x0020=
0000-0x003fffff] to [bus 02] add_size 200000 add_align 200000


This behavior change really looks suspicious to me (maybe resulting in two =
identical entries in the realloc_list).
Does that ring any bell?


Thanks, Klaus
