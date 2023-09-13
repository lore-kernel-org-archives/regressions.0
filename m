Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 126631E519
	for <regressions@lists.linux.dev>; Wed, 13 Sep 2023 11:25:36 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1bf55a81eeaso46989195ad.0
        for <regressions@lists.linux.dev>; Wed, 13 Sep 2023 04:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694604336; x=1695209136; darn=lists.linux.dev;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U+snWdPw4OwpiJyYyKW+q+QdDJNbVDVuE7cCYvKasOM=;
        b=oOXaAsQxFGWY/DBkGBFzZhb6KcwiBKfVdPu+mZynf/g58t+V27CZRuO/le3ymr2vW5
         wGP1Jj1sPzXWeGpiY/lnNBMkaPwSXpHA/xwDmc+/cf8qBpoWSWuB45pGbHO7M9OuAWpQ
         dR6DqZnpgt4nToZ97Jlzk6w26SrS9jtRUz0tUzwpPT23M2PmDlfgWkDQutVUizXJ+Phv
         9L2sChBkxcgvzjI+Rl1ZncmknCzJ9Yhq62iIMckjHPYqFaCNbktlG2iwiaH+dLo5F6YQ
         jvMazrcn75RoQRqpLM7UvK5aHCl04LuCbWyW2UWWlSDs2azsrPvhEsTeOVf0kUjk7DJB
         Vnmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694604336; x=1695209136;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U+snWdPw4OwpiJyYyKW+q+QdDJNbVDVuE7cCYvKasOM=;
        b=pcUsziGzmWgVUW/mYbzADqY7GonVDE2a9BmVNHPeiNWL0axFPVYg2+DpcgckOvikOd
         ObBNFdTqCiaYPU5YlPyKfWE9OSbS3sr9owFpCzSvMukvRJfQlyoqyQKb3PA19XBlmCEg
         BfTNiAje1Yyga7e+bEyKkmtyQTgz2lFpSQGmAyCocvJzHrRWm4aOeCHMVJYWSYL8O5pB
         wNcu7TKY4/zcKI8Uas54rxo/H9xP4tNgoJCdfRELQpNOMqnxZT2qB6k8SXDvCGLcbsJP
         LLfPumJXsE52WKERSIV67mzyvywssYvwbG5LN2G/uleitX6EuwGjqeaAb1sqPJT2lNig
         AqfA==
X-Gm-Message-State: AOJu0YxoMclZ/H75k+NaB7gIAW1+UgSvW+3ID6Wa0KtzO4BLS0uuVlkY
	6GysvNYyRzgiTGWQ8/xaRaY=
X-Google-Smtp-Source: AGHT+IG6qnNRjP8VGlU50n41ujtaU5WA8G9CE3Sr2eMhkVR7KTZlFt9dF+9n+pjjZ8ne4icdXU8kdQ==
X-Received: by 2002:a17:902:d70a:b0:1c3:8230:30d8 with SMTP id w10-20020a170902d70a00b001c3823030d8mr2375056ply.38.1694604336213;
        Wed, 13 Sep 2023 04:25:36 -0700 (PDT)
Received: from [192.168.0.106] ([103.124.138.83])
        by smtp.gmail.com with ESMTPSA id e4-20020a170902d38400b001b890009634sm10230532pld.139.2023.09.13.04.25.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Sep 2023 04:25:35 -0700 (PDT)
Message-ID: <dacb34e4-ce58-bc0e-8206-672d743a3e34@gmail.com>
Date: Wed, 13 Sep 2023 18:25:31 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Content-Language: en-US
To: Damien Le Moal <dlemoal@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 patenteng <dimitar@daskalov.co.uk>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux IDE and libata <linux-ide@vger.kernel.org>,
 Linux PCI <linux-pci@vger.kernel.org>
From: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Fwd: Kernel 6.5.2 Causes Marvell Technology Group 88SE9128 PCIe SATA
 to Constantly Reset
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

I notice a regression report on Bugzilla [1]. Quoting from it:

> After upgrading to 6.5.2 from 6.4.12 I keep getting the following kernel messages around three times per second:
> 
> [ 9683.269830] ata16: SATA link up 1.5 Gbps (SStatus 113 SControl 300)
> [ 9683.270399] ata16.00: configured for UDMA/66
> 
> So I've tracked the offending device:
> 
> ll /sys/class/ata_port/ata16
> lrwxrwxrwx 1 root root 0 Sep 10 21:51 /sys/class/ata_port/ata16 -> ../../devices/pci0000:00/0000:00:1c.7/0000:0a:00.0/ata16/ata_port/ata16
> 
> cat /sys/bus/pci/devices/0000:0a:00.0/uevent
> DRIVER=ahci
> PCI_CLASS=10601
> PCI_ID=1B4B:9130
> PCI_SUBSYS_ID=1043:8438
> PCI_SLOT_NAME=0000:0a:00.0
> MODALIAS=pci:v00001B4Bd00009130sv00001043sd00008438bc01sc06i01
> 
> lspci | grep 0a:00.0
> 0a:00.0 SATA controller: Marvell Technology Group Ltd. 88SE9128 PCIe SATA 6 Gb/s RAID controller with HyperDuo (rev 11)
> 
> I am not using the 88SE9128, so I have no way of knowing whether it works or not. It may simply be getting reset a couple of times per second or it may not function at all.

See Bugzilla for the full thread.

patenteng: I have asked you to bisect this regression. Any conclusion?

Anyway, I'm adding this regression to regzbot:

#regzbot: introduced: v6.4..v6.5 https://bugzilla.kernel.org/show_bug.cgi?id=217902

Thanks.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=217902

-- 
An old man doll... just what I always wanted! - Clara
