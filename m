Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF5D2EA16A
	for <regressions@lists.linux.dev>; Fri, 16 Jan 2026 20:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768597009; cv=none; b=XCLvl3xc1E8DDsQTN4opdjme8EZ9x8TbIcSAIgil47UwF26E+BOHH4gTsByIiLXp8oODSyEnJN0+QS0IBlES1EDVxltk6jplXlD1RiInGnb3yzi1O0jdK9e/RKTBUQUtRxG2khyxuSOT63o/kr6WeYK1XqucbyYmHWDdwCHaf9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768597009; c=relaxed/simple;
	bh=KW+YCk3jL0wohXBu5HKQJ96I7hqVok5gvj63pqpLlVg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Zbn9yMVCdkX6QzoyXiTf/OszUWye/zQbedt4Uak+rtPPS7ounrst6ZDeszv3tPAN6loNRHBD19RfbFPZMrau4dXQf/wrsbQq65z1rnCYZGNbvw6rQY0SeOjdx0De5OJLyCgK8eaIfEkR045DB3tTpxG+X0GE9raTsDgmOjXxbtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DtjaIeWu; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DtjaIeWu"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4801c1ad878so15569045e9.1
        for <regressions@lists.linux.dev>; Fri, 16 Jan 2026 12:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768597006; x=1769201806; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=0wPmsoU/VWwpse+1kjZEJCcgwRAW25UoomdQPrwRwsY=;
        b=DtjaIeWuKocpR7jVkiZUm5H+tXZCg/2yScJzA9rbO71upHn8YK2hPu/PFih50xY61K
         h5qq+2emq3l+pF6fQ4sn/REvxyeioeltkMTnxvDppvxWFIEV5Fh35ZgeJtDSrZXTfiBu
         OLOzVP/5p6bxI0QJxltAjWXIWWELmbJRbXwRvX+GvL+hniVkcQ1wuqnQcu6dbjFojmKM
         nez+0EdMCuCk9IjEhNP/fCLwghYxWAfepNcizw51HP6noQ0L24M7nDdC790uY9Eb3K8U
         cGllQbzjsNbBiTOWtpE8t8NDEhxUB9k9AZxIKOIre9RB/CmGo+GGF+l99gYo5U+yheR7
         /AkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768597006; x=1769201806;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0wPmsoU/VWwpse+1kjZEJCcgwRAW25UoomdQPrwRwsY=;
        b=qclKhT/enzjIlVsCqXkgepU/xIScuiLDIzFyD5CmZ132boFJrOompDKPB6sL3Wy3h7
         YGwdZ3wY5yQQp0IoXY8eC2Eipsr09LsOB/EcM69zfxlhj0JD/PmQmd1ra00Gu75Wtph0
         ECd38Vgd3SGP91iqdm/6ulrubONZt9VXZYLrgsJMk2LWdq3YEUJbHG/TVYL42J7+9R90
         8DvIkYNP3hCddcx/21oPwPCExeiO8ZAX7HekDN7L/xN97j8d1iYdyOkLxAezCPeyFx/h
         tzoWqjq9qWahMZlVEBAuUjRN/uhf29Td7gKbykacSCgiNy4v2cuLO2IUlZefYh70oPQ9
         g/GA==
X-Forwarded-Encrypted: i=1; AJvYcCVy0GPsD1nUIVU1dGHIWsS836Y64vy6L3Hy9L9uf15SF3edkKA4V7cmpgNyKULfQcG2WO4ZfpawR8ie3w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+lRFEmPgzHTNztHdDPyXu0LZf/GGkLXnkvWw4yIIPIZC88KWE
	PbTxjLGL/AzfuPGA+mgSr7yOswz2vUS6QVaOtV1V3drOR7Bhjd2Z7diUeJnTeDU/
X-Gm-Gg: AY/fxX4nG7nP2pThyJfmNCTEoV0Nej2+e1jcMUXpPyVepirDdv0B2bdT49sI348cOcy
	VCsPWSL69CEM2QSyKSVEv3g0sQonlkqvFfM+q6G3O3B/IaFx36B2SeEAZqmSbyI4wvVkA5u6rz9
	oSkHT4rqffIOTfsYVircAZNRa9hZHDlBQQ9vCqIo76OyEUhnhfe09sroL2Yxo+H5QcZCpb743RB
	DUYy8Hso2TUKGs8uixvJ8+RskKHhiPILd+y0ym9yVqtcLt5WuW2VXdF66wOpKsQV3pXzfnqGAoY
	TARnByIiP5KnxDZ8sotemFuwIr0W9qc/Yhzqwv7SI51q7jqokPn0gm6qtUNq4SFTfZ+iaoL2Tm4
	BRRDK3vJ+njwSGzhPpIsXkM9lMl4QhoZZJNcxUzrGMfBcCrRv7xwT29F5RWgE+kFaFnhkUPzYNM
	taDbmQj8OzPlS5ep9s1q5K4z0tERiHZf+rCFyCYr97ncWy
X-Received: by 2002:a05:600c:8b08:b0:47d:5d27:2a7f with SMTP id 5b1f17b1804b1-4801e347d3amr55463295e9.26.1768597006226;
        Fri, 16 Jan 2026 12:56:46 -0800 (PST)
Received: from eldamar.lan (c-82-192-244-13.customer.ggaweb.ch. [82.192.244.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801ea19f94sm26535935e9.3.2026.01.16.12.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 12:56:45 -0800 (PST)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Received: by eldamar.lan (Postfix, from userid 1000)
	id 53213BE2EE7; Fri, 16 Jan 2026 21:56:44 +0100 (CET)
Date: Fri, 16 Jan 2026 21:56:44 +0100
From: Salvatore Bonaccorso <carnil@debian.org>
To: stable@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Aboorva Devarajan <aboorvad@linux.ibm.com>, ritesh.list@gmail.com,
	hbathini@linux.ibm.com, mpe@ellerman.id.au,
	regressions@lists.linux.dev, benh@debian.org
Subject: [regression 6.1.y] Backport of 353d7a84c214f18
 ("powerpc/64s/radix/kfence: map __kfence_pool at page granularity") to
 stable versions 6.1 causes build failure
Message-ID: <aWqmDHdHVLs5M3HQ@eldamar.lan>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

In v6.1.160 353d7a84c214f18 ("powerpc/64s/radix/kfence: map
__kfence_pool at page granularity") was backported. But this now
causes a build failure:

make KERNELRELEASE=6.1.159+ ARCH=powerpc        KBUILD_BUILD_VERSION=3 -f ./Makefile
  CALL    scripts/checksyscalls.sh
  UPD     init/utsversion-tmp.h
  CC      init/version.o
  AR      init/built-in.a
  CC      arch/powerpc/mm/book3s64/radix_pgtable.o
In file included from arch/powerpc/mm/book3s64/radix_pgtable.c:35:
./arch/powerpc/include/asm/kfence.h: In function 'kfence_protect_page':
./arch/powerpc/include/asm/kfence.h:37:9: error: implicit declaration of function '__kernel_map_pages'; did you mean 'hash__kernel_map_pages'? [-Werror=implicit-function-declaration]
   37 |         __kernel_map_pages(page, 1, !protect);
      |         ^~~~~~~~~~~~~~~~~~
      |         hash__kernel_map_pages
cc1: some warnings being treated as errors
make[7]: *** [scripts/Makefile.build:250: arch/powerpc/mm/book3s64/radix_pgtable.o] Error 1
make[6]: *** [scripts/Makefile.build:503: arch/powerpc/mm/book3s64] Error 2

This is because 8f14a96386b2 ("mm: page_poison: always declare
__kernel_map_pages() function") is missing from 6.1.y (it was only
included in 6.5-rc1).

Cherry-picking 8f14a96386b2 fixes the build failure on powerpc.

#regzbot introduced 36c1dc122eb3b917cd2c343029ff60a366a00539

Marking as regression for 36c1dc122eb3 ("powerpc/64s/radix/kfence: map
__kfence_pool at page granularity"), for the 6.1.y specific commit
causing the regression.

Regards,
Salvatore
