Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793253725;
	b=GLwQV4msahQcZiYdixrSdAaKrX1mYAkAVh9D/0cdnBasP2klTeRO0LLYZlBL6nYtK0As
	 llyWPvOYxpuuzxhXs/48HJn70DC8jxThsXuA64n1lNMN8CoQ/hwTYRME1Rh+2qsBaibKa
	 xzAPM90lsBrtkV4ExH4lUs2+K7r2obw5z1xvhUghG7TVNl1C7qJfK03LOj5fUWGfBlKFQ
	 z7TmGxcZW9WGVFw2ifia3HsKt5f+HilIXHC8Fvqa6Uy6BnBN/nUan5NbOlJNpiZK0LDBT
	 kwT9uAuxtgV5W38C7h9HUVXTIlhdy1SE7Dmh/WODbYYy79/q3RHukPEADOkSPFlRP9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793253725;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=EdAvBAcKZJXO5bQEx4evcyI+B32P4syy7lujkQHXbGg=;
	b=QJuRrSuejKbnrttlWD7nTJ0F0q8BkJ6hAYPeJpC2+fKVzI4Gvp+pNXu+fkJItNw177pn
	 U7WkQ+5DPTIxBUnGQmvpbvhWB2+WHxyQWY052ozq8EacsC0TKEe9CfC5/7ZR+/nwEPVdo
	 p6QPCAr8U+xCYGyjgdflO8pbxcZC50qzVdZwFiBEgosLX1viqheYCLNMrnBSd3jX8AXtq
	 eM32EMLvJx+HAG7BJ9OJJFhuf4n5aHVUyMDG3rW9QIg7j3VJe8zrrBji57HK2l92ZZF2o
	 ac+45z39wG05ztQEMXZnbU4AAf1n22JdOnfPumCOB1PjmPskhPhD9zxx7ZN2kV0aLLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=debian.org;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zDmmBQkw;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7FA606A31D
	for <regressions@lists.linux.dev>; Thu, 29 Oct 2026 06:02:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A7FA606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zDmmBQkw
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so10564915e9.3
        for <regressions@lists.linux.dev>; Wed, 28 Oct 2026 23:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793253723; x=1793858523; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EdAvBAcKZJXO5bQEx4evcyI+B32P4syy7lujkQHXbGg=;
        b=zDmmBQkw/zdwD02i1c9xjUhpdXHIzaBEcxMTB0aGRtgOX30bQPPixaDXz7gdKn7sT3
         Qdc6DCQsJMTMAi2HYPE2RjlQ7SlO+MDDPfXO0fZBB5pfTXvQlH6sFyFjUG5HJtXBTnAS
         XAcnc5NlBIieadV60dpkcl0wlSlNA/U7Q1uxP5lJEZo7rdn2gfvgRKeyb9GVcsQZhdbj
         TNEOtpfIig8qiLvUtbOtN78bPkk2Y94u8iOoREePIONPprvhLFv6kzyWg/YalORc3y8w
         pD4ahz8fa+0HlZr8WH7h9Vm7SlrqLDqbIZUOtCDnN73DlrfOu83U/+K1cp1DNrEB59Ji
         Hm0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793253723; x=1793858523;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EdAvBAcKZJXO5bQEx4evcyI+B32P4syy7lujkQHXbGg=;
        b=DjCUScU/qrYDbs1ExxUWq+ezF1LcH8Yk3Bk9J4GP3192QHA/HflvHWKJgwrnmSDnXP
         hqn1I+w0KmseyioDEK31We37PpBBKRKenmxv2hRLAdUxIUSDdDs0/rEckxtMIt3vcYEY
         mfWM1rqgdm1E4IFDmT1ftkMkzhYdIuZ+7ZRncjTRB/k4D9DBdBqSk9x0RYdG1+zh8rUr
         +kTQHuTqwyP8kCiw3q/tf0gzqU04SdtDeaHptUgT/s8wxlpUrKTRYNECoxZkHjz4wIGe
         xotmM79KISHRb6tL8KDy6uOuj0drAFf6pauX9U0zNKAU3zXdQlhOEmwZaGBn6IXxeY7I
         InkQ==
X-Forwarded-Encrypted: i=1; AKwUvBwN4YeKkR7VhdnF9Kw6CR5OZJ3uqBu9o+tRSs2ta52w1HGcler5399qyxghy9y3rjSx2GGXsvKak1bvQw==@lists.linux.dev
X-Gm-Message-State: AFq9FYI0NUhlznxOBZK8rzdqs77aMolrf4EigE1EHNSou+9jcAUkAKKe
	dOloz9i10pPSLCLfRhJKQu25nd1WxMqXjOHIqwZTxZFEjt3mwyAIZc+3
X-Gm-Gg: AYBFou125CT8J4+ildbApLDtAJc2Boh1PRFHA7wBjDKg1Nxv++7yNmDaGr22ZzA1/8e
	42DJ0o/zOgruL+7IcdnGXbRQh2Ho2JhYb05VXUac2eoDqN9hkN7iYA0NMWpErM59TT8hTwP8Nfh
	rWHae6UyoaFPIGhV9Nhgv0zBOIu4m7EXEqAdIQrN8RsmvWKB0033cRFRw1KNCBBEcSXE4dTnQYa
	GPxQTZT7JjfWEZzpzN97AnIQQuC0UdYtl3ihDgOJGA1kT0UyzE44H91xCEJvSD7krhAjQyoClwa
	fS8H3FO4jkLTiOa8hE4iRb9iY8SIJ+1TPGczQJyXd78q4Gd8omy7oGSuM89oAYFOWuW0amLEK48
	vC5NDXFMW26Kp3/31WEx3axuey8fWgkzRMXBJK9z8tJpZhpXyMVNyD/NnBzJ0HEzbIiE/cdqvCi
	4StTtMzMubJMAmRl12kxZ8MtJOrKpf6rJlH5VmbIHF+9JkG7Y15ASwNKGx5FhqiG9mEw06j3+dU
	D68O41dqIN2Xm/l7El1w+Tzai8HwPxL7dJwADR4s/gcAhp2JwxIcdC6YL+r145MEWRKuEzjviK4
	bkGRck8uR4l6iGKFKgq+Wc6t2RY3oPotWhwbqb6mcZKWJgFu33FaWBXRVly5kIhb
X-Received: by 2002:a05:600c:3b8f:b0:4a1:dbdf:17a8 with SMTP id 5b1f17b1804b1-4a9643d381amr107367955e9.2.1793253722974;
        Wed, 28 Oct 2026 23:02:02 -0700 (PDT)
Received: from eldamar.lan (c-82-192-247-196.customer.ggaweb.ch. [82.192.247.196])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a94f05e4e4sm64585985e9.3.2026.10.28.23.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 23:02:02 -0700 (PDT)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Received: by eldamar.lan (Postfix, from userid 1000)
	id 59608DC0300; Thu, 29 Oct 2026 07:02:01 +0100 (CET)
Date: Thu, 29 Oct 2026 07:02:01 +0100
From: Salvatore Bonaccorso <carnil@debian.org>
To: Sasha Levin <sashal@kernel.org>
Cc: Christoph Zwerschke <cito@online.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Erik Brangs <erik.brangs@gmx.de>, benh@debian.org,
	stable@vger.kernel.org, regressions@lists.linux.dev,
	linux-bluetooth@vger.kernel.org, 1149377@bugs.debian.org,
	Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Re: [regression 6.12.y] After backport of 980084de4d9b ("Bluetooth:
 btusb: Add ASUS USB-BT540 for Realtek 8761CU") bluethooth not anymore
 working on 0b05:1bef ASUSTek Computer, Inc. Bluetooth Controller (requests
 firmware)
Message-ID: <auLhWSOpMQg6cALq@eldamar.lan>
References: <bdafa01c-f75a-41fa-a264-407400a2cd81@leemhuis.info>
 <2026-10-25-1-daily-reply-0004-bluetooth-asus-rtl8761cu-hold@kernel.org>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026-10-25-1-daily-reply-0004-bluetooth-asus-rtl8761cu-hold@kernel.org>

Hi,

On Sun, Oct 25, 2026 at 07:29:50PM -0400, Sasha Levin wrote:
> > > If it helps, I can send reverts of 980084de4d9b and 6f0624b4427e
> > > (on top of bluetooth.git master, with Cc: stable). Alternatively,
> > > btrtl could fall back to the ROM firmware when rtl8761cu_fw.bin
> > > is missing.
> > I didn't see any regression reports for 7.x releases about those
> > changes, [...] So I'm still inclined to say: leave everything as it is
> > in mainline to avoid any risk and revert only the backports of those
> > two in 6.18.y and 6.12.y.
> 
> Yup, that would be appreciated.

I'm bit lost here :) Who is now going to sen the reverts for the older
stable series? I'm bit worried that it will fall through the cracks,
but at least from Debian point of view given we want to closely follow
upstream stable releases I would pick the revert only in advance once
I know it is already as well in the stable queue for the next release.

Regards,
Salvatore
