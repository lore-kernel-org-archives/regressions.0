Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901292ED85D
	for <regressions@lists.linux.dev>; Wed, 29 Oct 2025 03:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761707037; cv=none; b=T4BV2/Ihv8Am4CuP76Jra/ItqSW5Hvhq4RlW3Zs5ndbdZ94XQgKf1Hfh+v754Z9Y+Rozmub7mMwnojviiluKFWhqbtd2rIXo5c6MIoIl+oRrVwXtQzKVy5sVYj+kK/he6ui/rh/2Tp3sYak7APpPDznsVrDL5VXBgziZBkJMJX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761707037; c=relaxed/simple;
	bh=/Qk8PMHP4+FapWuHqJbINkiDONl0t8szjkv4nlvTxXc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eYH3sq41KugOLFNm/a1LCSnFBY58ly8M/0BY35dBzdNrkJ9SOjQOKWiUyKp51/kL1uy2tOuIPdO7zaI1U0hTHASO9dg90CZQSjB0JwlR761HFEgxZQAq+8NTscB7YXj7cZ/6o94NqRo4I3L9r/EZQFkt/SGf5oEyI7Z2Nd3latg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E1GFQ+LW; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E1GFQ+LW"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4ed101e8486so17169371cf.2
        for <regressions@lists.linux.dev>; Tue, 28 Oct 2025 20:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761707034; x=1762311834; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=K5IcEnHZoC7+7r2CTBEYXEkgFoGQnDrtNgYAFEBdR6Q=;
        b=E1GFQ+LW8cjtGHpQXtwP9tGe0TEnzP0jJLQRICZVoZCkNb342xUbVrd97NpPFlmsCJ
         1Mo5P0gLQfCdFY6/T0y1tIRPLP7d+b7dIluW2jDQZRxkY69cVq7Xbh6TKuM8+6/Dl134
         O23PtJBx8+Li+vJXJnUlT9nAJcRc7tKL0pOFzzNNmRuuXKLp5dT6eb7GbWKzSUOORWQc
         CzqAznCUw5rvgQAd0gh718kT14onsSuxWzrZA7YEBr2y1x524jkAhOjGA3LRGuaK8FqH
         7LnuCgPGg2T8tKwy35cEWyPVPdzfzeSuw4uLqCOeiZ1VRoZeF7hIam1lTObdHrZEfsg3
         2rww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761707034; x=1762311834;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K5IcEnHZoC7+7r2CTBEYXEkgFoGQnDrtNgYAFEBdR6Q=;
        b=mNN1sFoZSQgweAYUFKdNmwMlBWtwambi6hClzoP1r/hpWNlM/vuTroB8ABD6dgaza3
         ySHosQuxy1NN1lRPygs/R8ajAYtee95hPNK02z7ccXuvgytuTKkUp2FVle3RN7WJDErh
         7htMPL5q1aJEKZE1pbMdVYUeZOYzlluU4gJcpzmOnLbw2ZFAsKpBINS4SlWdG50NWXLm
         bnqdNllCNn7T44aXeDPiywdkHUrOUkRuA+2yeyLdfEE2H6fNy0CK+1pMwY2gcuETnkDW
         JB1/uccmliVNcaYWE/WeysMlRZ7BYoHrspbaSxFsRhVav+v62ujcjqUJzAwbN40zMEGr
         QhZg==
X-Forwarded-Encrypted: i=1; AJvYcCUuxrupN+JU2oJZdEC8SuB27JaE52Kj7rBXsH5zqgZHTkdWZrY8gqfa2Vkahp1WinX0sNQPjfcoHISpTw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwUJdrLXvRNXrrhRXiIEsDFrvKczrNB3omUA9GZ/iWOgIw28Ou/
	Rrk2Pb6pzWR75WHYOMKIq0VJNBOx+I1FI1b0yDzZlXtt61WZvJoHCeKB
X-Gm-Gg: ASbGncte2rRHS6NMfyKlIFZTcMohzvc0v3FrNk/ZfY+4GFqEIokPImo4afC9PGBbktV
	rehes8e4IvlqtFn9ws5POct/BCUZWiwhZJeHIhFattET9uv559yQndJllxmWIzJiM6jaErUx1i5
	SGTdvXxaQWQ+BcSz1kOr4deVtIa2kJutwkUlg4Nhw4avDNByUHejtj6aZyOzpPm+yxX5j1TegrN
	RfLPgXQVfNO7QGyhPZp/fIha8wECmwA1Q5yuVTnZdeyx1OEuxEJuVK+WX7uXc1675n5vXrpNLsW
	i8DSqZKBV/NcpXOig8sMEOzC5lD3HwJbasuvzRzSCFBDeuDQQJJwtE2DsNMnBHMtDQvdyjOTe/A
	4i8oWh31VCtVhAxOF4Znt0CY5FNETJrbyfApC7mY7Bhg5olTFDnqXKxF7tZQVOdW1xOP8YgXcv6
	M=
X-Google-Smtp-Source: AGHT+IGn2yY7zgfs78ubfoXvJ06VhUkyVxJ/ldXNh2L/51YFEepFFBNff1jL42/SFQQHpekm3bsxHw==
X-Received: by 2002:a05:622a:1105:b0:4eb:7807:1816 with SMTP id d75a77b69052e-4ed15b5ab08mr18021921cf.35.1761707034388;
        Tue, 28 Oct 2025 20:03:54 -0700 (PDT)
Received: from sam-fedora ([142.182.130.176])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-89f254a6461sm1001074485a.30.2025.10.28.20.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 20:03:53 -0700 (PDT)
Date: Tue, 28 Oct 2025 23:03:50 -0400
From: Samuel Kayode <samkay014@gmail.com>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: linux-s390@vger.kernel.org, open list <linux-kernel@vger.kernel.org>,
	lkft-triage@lists.linaro.org,
	Linux Regressions <regressions@lists.linux.dev>,
	Anders Roxell <anders.roxell@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ben Copeland <benjamin.copeland@linaro.org>,
	Samuel Kayode <samuel.kayode@savoirfairelinux.com>,
	Samuel Kayode <samkay014@gmail.com>,
	Jerome Oufella <jerome.oufella@savoirfairelinux.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Frank Li <Frank.Li@nxp.com>, Sean Nyekjaer <sean@geanix.com>,
	Lee Jones <lee@kernel.org>, Heiko Carstens <hca@linux.ibm.com>
Subject: Re: next-20251027: s390: pf1550-onkey.c:154:12: error:
 'pf1550_onkey_resume' defined but not used [-Werror=unused-function]
Message-ID: <aQGEFr9aXB69_Eei@sam-fedora>
References: <CA+G9fYsL+w_XaOPaBaN5xMr6Ssrq_hh2_g8AgNxNmu0jCpjwxg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYsL+w_XaOPaBaN5xMr6Ssrq_hh2_g8AgNxNmu0jCpjwxg@mail.gmail.com>

Hi,

fix is at
https://lore.kernel.org/r/20251028-pf1550-v1-1-c50fae56b9b1@gmail.com

Thanks for reporting
Sam

On Mon, Oct 27, 2025 at 02:26:37PM +0530, Naresh Kamboju wrote:
> The following S390 allyesconfig build regressions noticed on the
> Linux next-20251027 tag with gcc-14.
> 
> * S390, build
>   - gcc-14-allyesconfig
> 
> First seen on next-20251027
> Good: next-20251024
> Bad: next-20251027
> 
> Regression Analysis:
> - New regression? yes
> - Reproducibility? yes
> 
> Build regression: next-20251027: pf1550-onkey.c:154:12: error:
> 'pf1550_onkey_resume' defined but not used [-Werror=unused-function]
> 
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> 
> ## Build error
> drivers/input/misc/pf1550-onkey.c:154:12: error: 'pf1550_onkey_resume'
> defined but not used [-Werror=unused-function]
>   154 | static int pf1550_onkey_resume(struct device *dev)
>       |            ^~~~~~~~~~~~~~~~~~~
> drivers/input/misc/pf1550-onkey.c:133:12: error:
> 'pf1550_onkey_suspend' defined but not used [-Werror=unused-function]
>   133 | static int pf1550_onkey_suspend(struct device *dev)
>       |            ^~~~~~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors
> make[6]: *** [/builds/linux/scripts/Makefile.build:287:
> drivers/input/misc/pf1550-onkey.o] Error 1
> 
> 
> ## Source
> * Kernel version: 6.18.0-rc2-next-20251027
> * Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
> * Git describe: next-20251027
> * Git commit: 8fec172c82c2b5f6f8e47ab837c1dc91ee3d1b87
> * Architectures: S390
> * Toolchains: gcc-14
> * Kconfigs: allyesconfig
> 
> ## Build
> * Test log:  https://storage.tuxsuite.com/public/linaro/lkft/builds/34dKrowtK5wNPnem1T5LSEjjq5o/build.log
> * Test details:
> https://regressions.linaro.org/lkft/linux-next-master/next-20251027/log-parser-build-kernel/gcc-compiler-_drivers_input_misc_pf-onkey_c_error_pf_onkey_resume_defined_but_not_used/
> * Build plan: https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/builds/34dKrowtK5wNPnem1T5LSEjjq5o
> * Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/34dKrowtK5wNPnem1T5LSEjjq5o/
> * Kernel config:
> https://storage.tuxsuite.com/public/linaro/lkft/builds/34dKrowtK5wNPnem1T5LSEjjq5o/config
> 
> --
> Linaro LKFT
