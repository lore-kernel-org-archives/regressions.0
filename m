Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4581684A4
	for <regressions@lists.linux.dev>; Mon, 23 Jun 2025 19:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750705665; cv=none; b=CSaNYm9VA0bSHgarxLopZFgkgF8q/y+XewXbXhgubgWdAyiY0yjtVYleP21nIPjEheazbv7FaixPWrskpU7iH9eOjuJ4DNLzr/yaV+ME6q+QP6Z9rdwaD8P4yguwbKDDyj5OlMGnGqGKcdm6cpfhslKxuVC7g25onlJMoHPzb0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750705665; c=relaxed/simple;
	bh=Cqplu8f4hWitp/dfm+57z4bYpEzAG44i8JZxloWIXxs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ag+X8xUvKpkqr1U6FmhdrOoKl9vBzYzbH5PDcvqW7zjHMOW2JsYmkqFxxcUZwAfK1Btmx3CCnS388KdjgHg4Qsi3Gr5ZdwysJO0SACSK0GXJ5Nf6gmShff5+VjoeSu0jgb7xEqlHpWUNudirEbVlt0Tyh/sXLr0bSY0jKalI7wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CpYTwmMB; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CpYTwmMB"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-451d54214adso30093965e9.3
        for <regressions@lists.linux.dev>; Mon, 23 Jun 2025 12:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750705661; x=1751310461; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uC7LQWCoV/JaAVtmtniWmiLNc6kWkM08c4IXcOjZlWs=;
        b=CpYTwmMBAvkENe57y6kFE+w2lgPnujmNxDpBa+x+WO1G0c7KPzvmcm+5RzPO2EYP9D
         UkX3s6N2WkxkiPYXhcH4LCK6AmEGzN/c/Ao/UvicHvnbxauo/GUhsjYOLgmesTe4yWUn
         bLszbime/sTBb2na7Jc0jhMxE5CLHzM+wsiBlm0j8G3jYAF6hqqloGlW9Yo2qW/3KuMp
         cO5lFeWBg6rXf4Th0XCtyh/OLp1MpaXmlOunSSBS7uqz2n5GFCDaWDgAzVsrx6Wx4Pnu
         Xoo4lpBD4bOsP0oYDrWXp+SA6dnji7G1BGb586OkjhXwngpah7N1f23Vtvjt2j/cFDAf
         7NTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750705661; x=1751310461;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uC7LQWCoV/JaAVtmtniWmiLNc6kWkM08c4IXcOjZlWs=;
        b=DvwhHvZ4+79bvigQ/s/iN2pFlcBZfY1zvw6iF4/jy2izeBvf9STGRXLDXfX9P6n/JQ
         xYE9fquIDxXZzAGzw/kPbbwwQIE50ZSFcL7TKAeVNTqd35obZXIqyCM05YRx06POQtik
         3BYjO+fvUptJ4uVBFJwHLm0W5TDNdfrQtU4L9wUbm1ZnOaCFFs6i2tTD5acvy6+JBhvs
         62IaVOLxmVzDy8tjvCGaMD+w+PE7+D/ABsvp3IB1ga5YjTwU3K+IwkkzJTCNqwoElsyn
         OjGEUHWBpWAQo4u2jMx/ETjH7PpKRKa+u0RJ7LJ5FS+fJz9SNWKRKu5r3yppDMQ97gDb
         D6ZA==
X-Forwarded-Encrypted: i=1; AJvYcCW4JR+e2HYB6dUf75S/9TrLCRyxktfCQpbcztT9dEmA+mAoyvq9rMZ4QB+jNbVqIiRyRFUxGwy/JYt9PQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwRFbOhLJqJYbt3lvg4+0Gvw4nEXJp/ZNJfgmIx3QNVYdKzUTiL
	k1mCy2vagNFajkVerMcWUxqenosWiIixun47+t4LV0IQ2yRi01zEwJz3
X-Gm-Gg: ASbGncsKXNrnon2wgw1GXuOPgElPAux/9fijzfR5xIVl2NuycLDS/Htb2GSULzRJWuU
	kGuPxh5O2n9ghMej4MgU9TX+Yo8dTWdogkmQO6Pwpo8WEPWphIIbZ7a1zLlHKcG3Gn7+cWANSPe
	JQaOtdPcQffjsdPntOBbHOX52zADXCDqwbFD++FnSioJjm42YmMBX5aHNCCVESxMThGmUYbYP6p
	M1KYzL5v402wEi1tIhKKU1/jAuMJh1igPxEK/ige8usMQLfIlsOvlU4k7ZLFntQ5L+xBqZNW8Up
	0S4SyxB0HPnGZ9mznIoxQKIaoObfedkFQB59Pq3V3CMP7X7sByAeNSex9mpGLaY9CtxHn/uplOg
	y0wXM1trKySitiSpQWg4=
X-Google-Smtp-Source: AGHT+IEVP5pvd/JbZjc3OIC2JD+r0G6o4NVC/z4QSgpCi5ldtfxVwt9glkS/VN4gp3sE+qwLzZ8ctQ==
X-Received: by 2002:a05:600c:358f:b0:442:d9f2:ded8 with SMTP id 5b1f17b1804b1-453659caba2mr138642735e9.15.1750705660967;
        Mon, 23 Jun 2025 12:07:40 -0700 (PDT)
Received: from eldamar.lan (c-82-192-244-13.customer.ggaweb.ch. [82.192.244.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535eac8e0asm152224315e9.23.2025.06.23.12.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 12:07:40 -0700 (PDT)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Received: by eldamar.lan (Postfix, from userid 1000)
	id 71C2FBE2DE0; Mon, 23 Jun 2025 21:07:39 +0200 (CEST)
Date: Mon, 23 Jun 2025 21:07:39 +0200
From: Salvatore Bonaccorso <carnil@debian.org>
To: Jeremy Lincicome <w0jrl1@gmail.com>
Cc: Shawn Lin <shawn.lin@rock-chips.com>, regressions@lists.linux.dev,
	Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
	1108065@bugs.debian.org, stable@vger.kernel.org, net147@gmail.com
Subject: Re: [regression v6.12.30..v6.12.32] mmc1: mmc_select_hs400 failed,
 error -110 / boot regression on Lenovo IdeaPad 1 15ADA7
Message-ID: <aFml-1X0-vItR2Au@eldamar.lan>
References: <aFW0ia8Jj4PQtFkS@eldamar.lan>
 <aFXCv50hth-mafOR@eldamar.lan>
 <004c6e95-7c1b-4a7f-ab68-1774ce5a51d7@rock-chips.com>
 <aFmPQL3mzTag5OxY@eldamar.lan>
 <35be0df5-b769-43ce-a9c4-7df4d4683dab@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <35be0df5-b769-43ce-a9c4-7df4d4683dab@gmail.com>

Hi,

On Mon, Jun 23, 2025 at 12:58:43PM -0600, Jeremy Lincicome wrote:
> On 6/23/25 11:30, Salvatore Bonaccorso wrote:
> > On Mon, Jun 23, 2025 at 05:13:38PM +0800, Shawn Lin wrote:
> > > + Jonathan Liu
> > > 
> > > 在 2025/06/21 星期六 4:21, Salvatore Bonaccorso 写道:
> > > > On Fri, Jun 20, 2025 at 09:20:41PM +0200, Salvatore Bonaccorso wrote:
> > > > > Hi
> > > > > 
> > > > > In Debian we got a regression report booting on a Lenovo IdeaPad 1
> > > > > 15ADA7 dropping finally into the initramfs shell after updating from
> > > > > 6.12.30 to 6.12.32 with messages before dropping into the intiramfs
> > > > > shell:
> > > > > 
> > > > > mmc1: mmc_select_hs400 failed, error -110
> > > > > mmc1: error -110 whilst initialising MMC card
> > > > > 
> > > > > The original report is at https://bugs.debian.org/1107979 and the
> > > > > reporter tested as well kernel up to 6.15.3 which still fails to boot.
> > > > > 
> > > > > Another similar report landed with after the same version update as
> > > > > https://bugs.debian.org/1107979 .
> > > > > 
> > > > > I only see three commits touching drivers/mmc between
> > > > > 6.12.30..6.12.32:
> > > > > 
> > > > > 28306c58daf8 ("mmc: sdhci: Disable SD card clock before changing parameters")
> > > > > 38828e0dc771 ("mmc: dw_mmc: add exynos7870 DW MMC support")
> > > > > 67bb2175095e ("mmc: host: Wait for Vdd to settle on card power off")
> > > > > 
> > > > > I have found a potential similar issue reported in ArchLinux at
> > > > > https://bbs.archlinux.org/viewtopic.php?id=306024
> > > > > 
> > > > > I have asked if we can get more information out of the boot, but maybe
> > > > > this regression report already rings  bell for you?
> > > Jonathan reported a similar failure regarding to hs400 on RK3399
> > > platform.
> > > https://lkml.org/lkml/2025/6/19/145
> > > 
> > > Maybe you could try to revert :
> > > 28306c58daf8 ("mmc: sdhci: Disable SD card clock before changing
> > > parameters")
> > Thanks.
> > 
> > Jeremy, could you test the (unofficial!) packages at
> > https://people.debian.org/~carnil/tmp/linux/1108065/ which consist of
> > 6.12.33-1 with the revert patch applied on top?
> > 
> > I have put a sha256sum file and signed it with my key in the Debian
> > keyring for verification.
> 
> Do I need all those packages?

Just the linux-image-6.12+unreleased-amd64-unsigned package to test
the patched kernel image and modules.

Regards,
Salvatore
