Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A2329DB84
	for <regressions@lists.linux.dev>; Mon, 23 Jun 2025 17:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750699847; cv=none; b=Hk4svEpdwkkdZDKSV/8arQLSszGwqsu2dU++ac9ipbynK+J9CXXPXjhUweK37Y9kMiQjU0j0cBRvU2WKXA+EmZL7jqJKkXWGyBC0MFgOcI5R8gmA6yjQZ+JY4UQ4jOYpvTVgKROtwhLo1deuZkub/oXFUfP/2d264xGkc2g4S3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750699847; c=relaxed/simple;
	bh=2BesTu0wNz7KZJSu07Q9JK+U9yK47g4valN5QlTVKo0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bRK8T3xwXmGZui9wS5FEAcY7CjvhL8dNNBQd57odtcdh7mlDZyYqCtI6+QJowvso1nByTCoADZXDeUBIy2hx649m89pejq6ytIKarPjVkkJEbFiVHhOt9T6A7plqXsIk4NFgk3OfsPg2VmfH5RP7HvGCRzjMm/vahFyWqWU7mwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LHG3fcem; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LHG3fcem"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a50fc7ac4dso2465923f8f.0
        for <regressions@lists.linux.dev>; Mon, 23 Jun 2025 10:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750699842; x=1751304642; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WXQZ1cIwev/BQqGGXRhlocv0p9SFoF8/dusQc6F0a2A=;
        b=LHG3fcem/wKTyrirtAwCK55miUQR3ihbpRxWJUYqHHrGSxC52nZ1p0+UYl6StCvCek
         NZ7uDCuMmUu0uJ1DdGUZSr9ctlNExd3FoQd9IxGUh75l/jSbi4e6OMylzss3jMGH+34j
         xiJwfLB8OIjiJ6YFfXZop99FEtiACoVolzkLfn5iGYPgAPhS2nRK8uEQ4/rG+RJxxGZx
         IKuEr2NVYVPr7xeeTZhpkTEVce/AO4PLObsJpdAQRxSHq2pqHxW2iKkwworLAm6TKAWW
         bg//+yPYdaOf9s1J47Z5PGxGYJ8PETuLEA0Upfa4EUMgsec5XVjTVgcqq88k831WXRVq
         BETw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750699842; x=1751304642;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WXQZ1cIwev/BQqGGXRhlocv0p9SFoF8/dusQc6F0a2A=;
        b=C6kZkFICFrY82Tqvq6REaqoSkToDGNNsixIYMF9NIbYav0IF63G4N/wk8n98UFMlpT
         YrpDVajCNh+Pcw5tUvZjggp95IvxlMXynJWsL5VZYqk9olHBfBvulTC8cza0P/PIN1UN
         g2t2OqEJfZxDL9N3N9o5A0/VYcWuRDBowqc6HUVCeRaL+uOj6jfZMGttSb63jTLAmujQ
         KGHOw5UdbgyN2vz2HJegTX2tYKld0knkr1BaFGq/VukxvBnCsu3GhN4PyoJNj3gaMC8n
         kr1VEgzimi/NDVu4wQiukYpsZEokyzDah1DVYlAZ0rIDe/i7sw08VAMaOUGMHe2rv+zH
         O9LA==
X-Gm-Message-State: AOJu0YyONQW1FuizMU7gpL1hXbgp0ZFhQp0JJ0+HzOs0QL+oOHEadyVL
	QhjsKpjoaqcjAGOBHVQu6ebn1AIwKbBRizBW/IbNKmF2JEZBQYl9EoTv
X-Gm-Gg: ASbGncv2Rb19fjBZh0igEY1+HfsVs8mv/Uu8npt0rpS9BW6hOaOUD5ISqPMulbRZNjE
	TD+V+Ul74ja+x5nUY0HjsukiqzydBskUXiYxFDn2Vltn+Rzptu0UohTgugaUY4CsBsZ7TxnaqUE
	0dSbgOcxIbSifX/zQlhw77mejEvyc7fN4ax4v9sR5uO6KDt515JazOWfa14a7RoSUrOCKIxLXEe
	9lJ5XMcVrafjLmsyPjV4VYIPteSx4lh3DaIM53fdsnZSUCrTsIktc9VIVs18ARuRdWzq4suan6y
	L82cCBdKUeH4wxbHvvOO9WOaTm9wnrwmirtgxX8vfQgimFNsBBUPAMKBN7JpQ/Q59UKs0z5Rw4l
	xNlF13+Rm3dHgcCsE2Ido9v7mgbmPog==
X-Google-Smtp-Source: AGHT+IEs1XjUK+7RdkSK9C+mWF0kQF29FZVxtmG0QAQoTQntyWVyT19lNoq/l9WZJeQpLq/vI6uOZg==
X-Received: by 2002:a5d:5f8d:0:b0:3a4:dd8e:e16b with SMTP id ffacd0b85a97d-3a6d1301ffemr10136431f8f.20.1750699842006;
        Mon, 23 Jun 2025 10:30:42 -0700 (PDT)
Received: from eldamar.lan (c-82-192-244-13.customer.ggaweb.ch. [82.192.244.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d1188c6esm9692456f8f.81.2025.06.23.10.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 10:30:41 -0700 (PDT)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Received: by eldamar.lan (Postfix, from userid 1000)
	id 20CA4BE2DE0; Mon, 23 Jun 2025 19:30:40 +0200 (CEST)
Date: Mon, 23 Jun 2025 19:30:40 +0200
From: Salvatore Bonaccorso <carnil@debian.org>
To: Shawn Lin <shawn.lin@rock-chips.com>,
	Jeremy Lincicome <w0jrl1@gmail.com>
Cc: regressions@lists.linux.dev, Ulf Hansson <ulf.hansson@linaro.org>,
	linux-mmc@vger.kernel.org, 1108065@bugs.debian.org,
	stable@vger.kernel.org, net147@gmail.com
Subject: Re: [regression v6.12.30..v6.12.32] mmc1: mmc_select_hs400 failed,
 error -110 / boot regression on Lenovo IdeaPad 1 15ADA7
Message-ID: <aFmPQL3mzTag5OxY@eldamar.lan>
References: <aFW0ia8Jj4PQtFkS@eldamar.lan>
 <aFXCv50hth-mafOR@eldamar.lan>
 <004c6e95-7c1b-4a7f-ab68-1774ce5a51d7@rock-chips.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <004c6e95-7c1b-4a7f-ab68-1774ce5a51d7@rock-chips.com>

On Mon, Jun 23, 2025 at 05:13:38PM +0800, Shawn Lin wrote:
> + Jonathan Liu
> 
> 在 2025/06/21 星期六 4:21, Salvatore Bonaccorso 写道:
> > On Fri, Jun 20, 2025 at 09:20:41PM +0200, Salvatore Bonaccorso wrote:
> > > Hi
> > > 
> > > In Debian we got a regression report booting on a Lenovo IdeaPad 1
> > > 15ADA7 dropping finally into the initramfs shell after updating from
> > > 6.12.30 to 6.12.32 with messages before dropping into the intiramfs
> > > shell:
> > > 
> > > mmc1: mmc_select_hs400 failed, error -110
> > > mmc1: error -110 whilst initialising MMC card
> > > 
> > > The original report is at https://bugs.debian.org/1107979 and the
> > > reporter tested as well kernel up to 6.15.3 which still fails to boot.
> > > 
> > > Another similar report landed with after the same version update as
> > > https://bugs.debian.org/1107979 .
> > > 
> > > I only see three commits touching drivers/mmc between
> > > 6.12.30..6.12.32:
> > > 
> > > 28306c58daf8 ("mmc: sdhci: Disable SD card clock before changing parameters")
> > > 38828e0dc771 ("mmc: dw_mmc: add exynos7870 DW MMC support")
> > > 67bb2175095e ("mmc: host: Wait for Vdd to settle on card power off")
> > > 
> > > I have found a potential similar issue reported in ArchLinux at
> > > https://bbs.archlinux.org/viewtopic.php?id=306024
> > > 
> > > I have asked if we can get more information out of the boot, but maybe
> > > this regression report already rings  bell for you?
> 
> Jonathan reported a similar failure regarding to hs400 on RK3399
> platform.
> https://lkml.org/lkml/2025/6/19/145
> 
> Maybe you could try to revert :
> 28306c58daf8 ("mmc: sdhci: Disable SD card clock before changing
> parameters")

Thanks.

Jeremy, could you test the (unofficial!) packages at
https://people.debian.org/~carnil/tmp/linux/1108065/ which consist of
6.12.33-1 with the revert patch applied on top?

I have put a sha256sum file and signed it with my key in the Debian
keyring for verification.

Regards,
Salvatore
