Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28F128F1
	for <regressions@lists.linux.dev>; Wed, 10 Aug 2022 14:03:47 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id 12so14452542pga.1
        for <regressions@lists.linux.dev>; Wed, 10 Aug 2022 07:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc;
        bh=p8mtjx8JwOj09UK2SbqBNp9/cVRUkNodrG3vv7jXsbc=;
        b=r67rwasignVgPzllz4gI2jNUvcLyFJXgHkzyUSYHOq3j+Bm38y3AbJrg8u86pE3nTC
         0rwCLgLU42DNmUtDxIjz6pxzKKLctVrT9Mnfnh82ULGBWT5gjnW/YXW6csfzvNG4UvR3
         pZGslfBRq5nfwCfw4O+s3QcOJjOH1qIkXgiOIyY3pyjcoK2FQKfYxrXCI7QPtTWaLWzt
         eKwft6YPv+lj0SBcE9yefIqLjy6H+Rt8l1pH2RguvhU5Dt2nILS95fJxFVRjoVy8DlEH
         tSZCrVHxvnE8yGqrch4yOF3Sa+7ZNlSQiKI6cpL6mOAl3xSljzL4+aWAMRO2hEPOdFzg
         laIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=p8mtjx8JwOj09UK2SbqBNp9/cVRUkNodrG3vv7jXsbc=;
        b=djU5AlpydQbaSBqJw3QPr3TZxipnEyyEOob2hVCBWsZrj7gxDoD49WP4kFT2tfTMfu
         VwjLtwm0McJEP70qa57FSViiiLuJqv49T1mTLeXbDbZu7weMbQehaCObB0kKFUJnidAA
         t9wFPwZYUOo23z9A/N/2b2LAA8zdOYUTq7OOXz+cqDQbXNm0XCna5gtluOzLyLCLNi2s
         FNHZ5/kr7rZgzHDZwre4t/UaEyx2CDN0/MmzXVZqVTHoPXUynup+ri4Q9AAjSV9P+KGP
         mI5hwOSGMq2xMD/yWOH06NmpPQ1YeL7s7eHsSCV6GpV+4Z7kZFEazUE/Ib0Yz503TpCX
         Kmkg==
X-Gm-Message-State: ACgBeo0Vvf+Q1sJ7X2sKL5LAiDASvqqvFkmiFLW3zh2apJHIrHpLdNQY
	yBgTm1JnyLKL83pvXzq/Pxd4/A==
X-Google-Smtp-Source: AA6agR4OHVY8R26UHtWDV7yFoG5TWHXLzX/TJQITwX0M3Cbh5d9+pfZ4/9kCsPTDJpHQPSyN1vWMuQ==
X-Received: by 2002:a65:57c8:0:b0:41c:fa29:ae1d with SMTP id q8-20020a6557c8000000b0041cfa29ae1dmr22100855pgr.136.1660140227200;
        Wed, 10 Aug 2022 07:03:47 -0700 (PDT)
Received: from hermes.local (204-195-120-218.wavecable.com. [204.195.120.218])
        by smtp.gmail.com with ESMTPSA id t13-20020a17090340cd00b0016dc6279ab8sm12772873pld.159.2022.08.10.07.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Aug 2022 07:03:46 -0700 (PDT)
Date: Wed, 10 Aug 2022 07:03:44 -0700
From: Stephen Hemminger <stephen@networkplumber.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, bhelgaas@google.com,
 gregkh@linuxfoundation.org, linux-pci@vger.kernel.org,
 regressions@lists.linux.dev
Subject: Re: [REGRESSION] changes to driver_override parsing broke DPDK
 script
Message-ID: <20220810070344.1701f4a6@hermes.local>
In-Reply-To: <28388e27-e562-65cd-4663-977ea4ad51a0@linaro.org>
References: <20220809192102.GA1331186@bhelgaas>
	<af880c1a-cedd-181f-9b4d-2f1766312fc0@linaro.org>
	<28388e27-e562-65cd-4663-977ea4ad51a0@linaro.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 10 Aug 2022 09:13:40 +0300
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> On 10/08/2022 08:54, Krzysztof Kozlowski wrote:
> > On 09/08/2022 22:21, Bjorn Helgaas wrote:  
> >> [+cc regressions list]
> >>
> >> 23d99baf9d72 appeared in v5.19-rc1.
> >>
> >> On Tue, Aug 09, 2022 at 11:29:43AM -0700, Stephen Hemminger wrote:  
> >>> This commit broke the driver override script in DPDK.
> >>> This is an API/ABI breakage, please revert or fix the commit.
> >>>
> >>> Report of problem:
> >>> http://mails.dpdk.org/archives/dev/2022-August/247794.html  
> > 
> > Thanks for the report. I'll take a look.
> >   
> 
> I could not find in the report (neither here) steps to reproduce it. Can
> you provide me some short description (what kernel options are required,
> what commands to run)?
> 
> I tried to run:
> $ usertools/dpdk-devbind.py --status
> $ usertools/dpdk-devbind.py --bind '0000:00:03.0'
> Error: No devices specified.
> 
> 
> Best regards,
> Krzysztof

To test, you need to be willing to have one network device disappear from
kernel. The bug is in the unbind step this is an example of it working
with 5.17 kernel.


~/DPDK/main $ ./usertools/dpdk-devbind.py --status

Network devices using kernel driver
===================================
0000:01:00.0 'Wi-Fi 6 AX200 2723' if=wlo1 drv=iwlwifi unused= 
0000:02:00.0 'RTL8125 2.5GbE Controller 8125' if=enp2s0 drv=r8169 unused= *Active*


~/DPDK/main $ sudo modprobe vfio-pci
~/DPDK/main $ sudo ./usertools/dpdk-devbind.py --bind=vfio-pci enp2s0
Warning: routing table indicates that interface 0000:02:00.0 is active. Not modifying
~/DPDK/main $ ip li set dev enp2s0 down
RTNETLINK answers: Operation not permitted
~/DPDK/main $ sudo ip li set dev enp2s0 down
~/DPDK/main $ sudo ./usertools/dpdk-devbind.py --bind=vfio-pci enp2s0
~/DPDK/main $ ./usertools/dpdk-devbind.py --status

Network devices using DPDK-compatible driver
============================================
0000:02:00.0 'RTL8125 2.5GbE Controller 8125' drv=vfio-pci unused=r8169

Network devices using kernel driver
===================================
0000:01:00.0 'Wi-Fi 6 AX200 2723' if=wlo1 drv=iwlwifi unused=vfio-pci 


~/DPDK/main $ sudo ./usertools/dpdk-devbind.py -u 0000:02:00.0
~/DPDK/main $ ./usertools/dpdk-devbind.py --status

Network devices using kernel driver
===================================
0000:01:00.0 'Wi-Fi 6 AX200 2723' if=wlo1 drv=iwlwifi unused=vfio-pci 

Other Network devices
=====================
0000:02:00.0 'RTL8125 2.5GbE Controller 8125' unused=r8169,vfio-pci

