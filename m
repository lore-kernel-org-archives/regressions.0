Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF10168C3
	for <regressions@lists.linux.dev>; Tue, 11 Jul 2023 12:41:10 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3159d5e409dso1256113f8f.0
        for <regressions@lists.linux.dev>; Tue, 11 Jul 2023 05:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689079268; x=1691671268;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=t/3Y5eqgUDi7lnr0rk+hWsRfp5e3voV9c3ZLFxt0Inc=;
        b=c7ka5wjnDDt+Qsm1M0tCumBT7q4VnoBU/CsY5j79PwKYyD0g31Tl6Mw6I6UJ4OHtxd
         iEth1DprPLB6THVlX8GMLcacluvnaoJZlgq2l3wV1wdedTNDFSu8Af6HcG8fUoZvE+XH
         3rXacNuOt9HJjfUrtLANBu858uBEO/34h5m86Hz7AbooJwmXmPVSBkHN+YHVs3C3UmUL
         FiX3vG5S7pZt2YLf1kG0xFOPg6VyWjqs13KMoq0yxv72UncwUzSUe9tGTVbpC/G6ZAmK
         YJfNvTmC8s4neip6dkvdyCOZCB9LalDtIv+5un3TJZk/4A+DIDkn16i8QVB5o+3po71k
         /rNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689079268; x=1691671268;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t/3Y5eqgUDi7lnr0rk+hWsRfp5e3voV9c3ZLFxt0Inc=;
        b=BRk7xhiJi/6KgVny0yXPpyr9G2wVyxrzK2eU18thhoF4s35dRaRAzBSgqHOLYpDnRc
         ILpk91CucKg+ALgQNmpdZ669Cwl5cy+uYdojz1cjf25T/6XpoU28blQ2J6t5NAM6GwO6
         k0F/8eE8TpPQncoQKeTLvZS5ck76Pj6s0mTPUDNiazSlYirfB9/REP7kXMNC2SGjkbPf
         OOXQ/LAWBmucBBEzOOEr6mpHAywdmjorp/+BhlNcsrsQBXL1iCp6Yv+FNdsBxoG7Xjt9
         bOF1GJrvUuaalLDUJDLDcSp0xQXl2X3P6HS+IkpfgMv00nLSPQ+OioNY4KW0vfa441gM
         SW6Q==
X-Gm-Message-State: ABy/qLYB3MzZ8gHTAZhZ02CA/eYsAR7fq/qzjzyuZ9jo4VTMgX61QmIc
	yr6Lp4zne60H9flL7tEPBA8=
X-Google-Smtp-Source: APBJJlEi3QmwW3hwZSARaZwsURkuc1YZVSe0WBhWz6AyB6fPXT8oNYBGxh7NbHB6m6Pf32AJadzU2w==
X-Received: by 2002:adf:ef89:0:b0:314:140a:e629 with SMTP id d9-20020adfef89000000b00314140ae629mr17326624wro.7.1689079268381;
        Tue, 11 Jul 2023 05:41:08 -0700 (PDT)
Received: from [192.168.1.23] ([176.232.61.170])
        by smtp.gmail.com with ESMTPSA id b16-20020a5d5510000000b0031417b0d338sm2167257wrv.87.2023.07.11.05.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 05:41:07 -0700 (PDT)
Message-ID: <bb5580e93d244400c3330d7091bf64868aa2053f.camel@gmail.com>
Subject: Re: [PATCH v2 1/2] tpm/tpm_tis: Disable interrupts for Framework
 Laptop Intel 12th gen
From: Grundik <ggrundik@gmail.com>
To: Jarkko Sakkinen <jarkko@kernel.org>, Christian Hesse <list@eworm.de>, 
	linux-integrity@vger.kernel.org
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, Lino Sanfilippo
 <l.sanfilippo@kunbus.com>, Linux kernel regressions list
 <regressions@lists.linux.dev>, Peter Huewe <peterhuewe@gmx.de>, Christian
 Hesse <mail@eworm.de>, stable@vger.kernel.org, roubro1991@gmail.com, Linus
 Torvalds <torvalds@linux-foundation.org>
Date: Tue, 11 Jul 2023 15:41:05 +0300
In-Reply-To: <bd0587e16d55ef38277ab1f6169909ae7cde3542.camel@kernel.org>
References: <20230710133836.4367-1-mail@eworm.de>
	 <20230710142916.18162-1-mail@eworm.de>
	 <20230710231315.4ef54679@leda.eworm.net>
	 <bd0587e16d55ef38277ab1f6169909ae7cde3542.camel@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.3 (by Flathub.org) 
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Tue, 2023-07-11 at 00:29 +0300, Jarkko Sakkinen wrote:
> On Mon, 2023-07-10 at 23:13 +0200, Christian Hesse wrote:
>=20
>=20
> OK, this good to hear! I've been late with my pull request (past rc1)
> because of kind of conflicting timing with Finnish holiday season and
> relocating my home office.
>=20
> I'll replace v2 patches with v3 and send the PR for rc2 after that.
> So unluck turned into luck this time :-)
>=20
> Thank you for spotting this!

I want to say: this issue is NOT limited to Framework laptops.

For example this MSI gen12 i5-1240P laptop also suffers from same
problem:
        Manufacturer: Micro-Star International Co., Ltd.
        Product Name: Summit E13FlipEvo A12MT
        Version: REV:1.0
        SKU Number: 13P3.1
        Family: Summit

So, probably just blacklisting affected models is not the best
solution...

