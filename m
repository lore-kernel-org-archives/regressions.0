Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B0319259F
	for <regressions@lists.linux.dev>; Wed, 25 Jun 2025 03:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750822811; cv=none; b=EAAaSrlJyGS8tluh+Uq8aGsEJNQE1px7r5qrRqlze4r1rOYeZg5m97CtQp4THA7Djs8K65AC8Sz8gUSyhjtIqeLZeks+Gm2yDW2bD58xeI7wDkgN2pjGujZDNt5CWGAssTouM6lZQ8GDZl1/fphKLhvuGpwM//qvlnzwJuvSSrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750822811; c=relaxed/simple;
	bh=HTN4j6beo8XoNfCpziYtC8mCBfKnTgXon8D+1hjrVCI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EzZgslFEh0Xjt756PT/2mwVT6MOqOlmcGQq+PJhDmv/LRaxpP/6XUfHtgqwdf1l6Tl/zh+s2rx2LQ8tq6MoD+8nfOhjIr0JdDQzRt0/SkW69H+RgJ9LVIgjrtZrU2e1W4JG3KyIPzeTXZjcg3JwY/7Utc8d4Kt9roNQacqcLtw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dy4YZyKh; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dy4YZyKh"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4536b8c183cso2519195e9.0
        for <regressions@lists.linux.dev>; Tue, 24 Jun 2025 20:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750822807; x=1751427607; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i8Kzx4KoqtuSZ/XdxUjKebeViIMJctJX7JPgnZgO9sg=;
        b=Dy4YZyKhcfYNBW77LnRG/lxTTopthvHuOS/AqHfzXyJXse8mccIDW6z3P/GcQzDMZP
         f8ufCHdfZFKB/OYavVnA+tiwW25o6DThhDKhDKzS/Kw1X/3IXD2GFcLEcYK3AxfEMwP0
         yfQtal7EJc0M/3g4DCW1lkxV0gOd7kItTmi03mVQLP8LnYAtzOWIqhpQ4aqfx7/Y9LO1
         vi632o+3YYQh0P5uwcKs7fyQg2fNQXlW/XLzk7P35MygackX9YDga1vWRR/k4iocka/+
         QQwsWW0dZFFmnvdAsmLVuCs+U+c57ZM4KjgSYCRze8zBbCWiC5oAMNRm2nAQY9f73CX8
         elxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750822807; x=1751427607;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i8Kzx4KoqtuSZ/XdxUjKebeViIMJctJX7JPgnZgO9sg=;
        b=dtuFZopwrPfk/O7cVzqYnpzeiQokYKEsizFaNzUBMWd7tBPxoekYBe58KaxaexFcPq
         aWyl4Lnv5roc38phhQdITVsMeYc1N7gC2VYCduAs8b01QIh/9mCLupQDbmB6cwMIl+G9
         o6jgJofp75aErOvAe95pKV6lMTw7ihLNoWnLgjNhIwyvHzx+tq0OOOWrMgjOieH9rViQ
         GqRBeUpCVl62l0ibHctgxe7eS3NDbnThNg2BBolFdxju9KlcPXsLwUIOVgAn65mmQvIO
         +OVIlgMUKnawZi+tPIRQ+2jUifnncf09uaZIEogfhnF7NsoTZH9EqWCC3TVKm4OhziOu
         qKPw==
X-Forwarded-Encrypted: i=1; AJvYcCVAG4FSZpIZoIOQGto+Yf0uOO4eVQU1k2tlSdEjboeigNM/G12GKkU6tMGST+X9RfIuUVu9norq8GBopg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxmKWGNAqOVi9tMzQVY7hOLsMru8GfwOl8mIpFHjxsNpW3HvLGd
	YDahcz/8YqKF41fiIW3G571MYga4BNdolqWh7rVNYBaPmDm7ljFZ8CXY
X-Gm-Gg: ASbGncvUiQ1i8WE0GJhfxDC2cXKxhOYGgNSrooYCvDDYEDEVi6YRNtCgrVlHNHdINgj
	xh03qUyFOb5EuedtHQTOlnyiJrYnyqukA/wdTqdLQ7Pvi8Azr3zwfefm6K+ga6D9HUiIxGEhJvQ
	SEkkXynVx6pcv8nkw1Taz2pl4J1iWc4EWnYiR63fnaIWju04T+ZvmcZPg5j1r1W5QHtzbW7KbLa
	QGGPc81r7hsYDaVnanmlqs9X1J9Zl8wcKHe87YfLRTyksnTiyG70N7zJA1vn/CS9B4j2i8ethBb
	ZDCdoL3guXvp81ox6Z85FU0LDby4ZK4P9BPCBk91bshWDS7zPFBaoU6SUFHgCmMb572XMI4Ant0
	ohftjFMyHOZ3y8ZJTiQk=
X-Google-Smtp-Source: AGHT+IHa/xBtBOaEIq7LdYmOvKqiiJCY3VJZLSTUGHohTxGoXmGPfluK0CzBv8XNLk4u7cyPComKcg==
X-Received: by 2002:a05:600c:871b:b0:450:d79d:3b16 with SMTP id 5b1f17b1804b1-45381bc0fe6mr10739405e9.14.1750822807508;
        Tue, 24 Jun 2025 20:40:07 -0700 (PDT)
Received: from eldamar.lan (c-82-192-244-13.customer.ggaweb.ch. [82.192.244.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823ad186sm6910025e9.21.2025.06.24.20.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 20:40:06 -0700 (PDT)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Received: by eldamar.lan (Postfix, from userid 1000)
	id 28EC5BE2DE0; Wed, 25 Jun 2025 05:40:06 +0200 (CEST)
Date: Wed, 25 Jun 2025 05:40:06 +0200
From: Salvatore Bonaccorso <carnil@debian.org>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: Shawn Lin <shawn.lin@rock-chips.com>, regressions@lists.linux.dev,
	Jeremy Lincicome <w0jrl1@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
	1108065@bugs.debian.org, stable@vger.kernel.org, net147@gmail.com
Subject: Re: [regression v6.12.30..v6.12.32] mmc1: mmc_select_hs400 failed,
 error -110 / boot regression on Lenovo IdeaPad 1 15ADA7
Message-ID: <aFtvlqPxO6eZkhfF@eldamar.lan>
References: <aFW0ia8Jj4PQtFkS@eldamar.lan>
 <aFXCv50hth-mafOR@eldamar.lan>
 <004c6e95-7c1b-4a7f-ab68-1774ce5a51d7@rock-chips.com>
 <65400f7d-0bfc-4b0c-8edc-c00d3527c12b@intel.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <65400f7d-0bfc-4b0c-8edc-c00d3527c12b@intel.com>

Hi,

On Tue, Jun 24, 2025 at 11:26:41AM +0300, Adrian Hunter wrote:
> On 23/06/2025 12:13, Shawn Lin wrote:
> > + Jonathan Liu
> > 
> > 在 2025/06/21 星期六 4:21, Salvatore Bonaccorso 写道:
> >> On Fri, Jun 20, 2025 at 09:20:41PM +0200, Salvatore Bonaccorso wrote:
> >>> Hi
> >>>
> >>> In Debian we got a regression report booting on a Lenovo IdeaPad 1
> >>> 15ADA7 dropping finally into the initramfs shell after updating from
> >>> 6.12.30 to 6.12.32 with messages before dropping into the intiramfs
> >>> shell:
> >>>
> >>> mmc1: mmc_select_hs400 failed, error -110
> >>> mmc1: error -110 whilst initialising MMC card
> >>>
> >>> The original report is at https://bugs.debian.org/1107979 and the
> >>> reporter tested as well kernel up to 6.15.3 which still fails to boot.
> >>>
> >>> Another similar report landed with after the same version update as
> >>> https://bugs.debian.org/1107979 .
> >>>
> >>> I only see three commits touching drivers/mmc between
> >>> 6.12.30..6.12.32:
> >>>
> >>> 28306c58daf8 ("mmc: sdhci: Disable SD card clock before changing parameters")
> >>> 38828e0dc771 ("mmc: dw_mmc: add exynos7870 DW MMC support")
> >>> 67bb2175095e ("mmc: host: Wait for Vdd to settle on card power off")
> >>>
> >>> I have found a potential similar issue reported in ArchLinux at
> >>> https://bbs.archlinux.org/viewtopic.php?id=306024
> >>>
> >>> I have asked if we can get more information out of the boot, but maybe
> >>> this regression report already rings  bell for you?
> > 
> > Jonathan reported a similar failure regarding to hs400 on RK3399
> > platform.
> > https://lkml.org/lkml/2025/6/19/145
> > 
> > Maybe you could try to revert :
> > 28306c58daf8 ("mmc: sdhci: Disable SD card clock before changing parameters")
> 
> Given the number of other reports, probably best to revert
> anyway.

FTR, Jeremy Lincicome confirmed that reverting the commit fixes the
issue for him as reported in Debian bug #1108065.

Regards,
Salvatore
