Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B84CA65
	for <regressions@lists.linux.dev>; Tue,  5 Sep 2023 20:11:29 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-501bd6f7d11so1939196e87.1
        for <regressions@lists.linux.dev>; Tue, 05 Sep 2023 13:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693944688; x=1694549488; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=w2c0X/15jRHBgEVSCCaDEJe6vWwc+ez2XuJO2zWQ3kY=;
        b=UwhpaNFvVNdJP4vaJWyg8iQ/Fu/fbzrPEGQPJsb71atc+SNsEk5meKX7PDXo/fWRG4
         sB8VAL+Z5A0/vpmhI4UoOMp1bbNE/n0rIE0cUuTZEMKRTRTXRzqn+yxPUshQbvH8qwPA
         7UGsb9vbJcrw5M+Ohau7q56tlEfFi8ISAalDZ+QmvG7me5/gjCRd48MOjnhkdtOVKUjF
         SzL+H/YzOz7BfxVq2tmeo6vUPRiY9eRG94d4TIu8s0a9jTQsgv+nJrK2tPUq+5u6BLwv
         LyV56X23Qhl4h/8N/urY4FNYcJjNx0zOaBQmGBLjKBrzqkHRRtUTvTpHOv6OHO9uC1iV
         gmnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693944688; x=1694549488;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w2c0X/15jRHBgEVSCCaDEJe6vWwc+ez2XuJO2zWQ3kY=;
        b=bYystTF+Oz/sTlyVaTX5mq0NGp/YzkXEqGsZTLkvQPndGYuMTcOMPv84EXhhuhpJqo
         6psjOTfxGZFIcls6WgkV2sACloaC5UzzAlf45WkA4dfdfxnV5Ee4LEofucGx2iV7cf4a
         QW7Bmhk+ZZgi5wXRasP2if35Mi4O8FmUJfgLVOCHoz+o+wmwq1h8ukLsPzcw0G37BsiB
         drbMGtiPpnOoxwp3VovCBLqV2ICOY9nPYHvrf5o54f/4jwXuuD8WuD990KnKEhqkqC+Y
         YAnC89w1cbFEkUV1e/1cT3fX0BRqUbku5kHwMZ/vCQe1l4H8LLTmVbZT18BxarsRb4iY
         w2Ug==
X-Gm-Message-State: AOJu0YzE50KKKTeHJSMU8X5VDnEUvivUV/FtZRwL0Wug1uYZWILR8USR
	GtbzwATkGpK3SU+a+YGHwJs=
X-Google-Smtp-Source: AGHT+IHFowLDY6tJlLBXTNIpcha+Msm1E/UAmVgsnSTFGVA9BG8YgXxGRbHrBqfPB59mY2lJT0YERg==
X-Received: by 2002:a05:6512:313b:b0:500:8f65:c624 with SMTP id p27-20020a056512313b00b005008f65c624mr557196lfd.53.1693944687570;
        Tue, 05 Sep 2023 13:11:27 -0700 (PDT)
Received: from [192.168.10.127] (net-188-216-175-96.cust.vodafonedsl.it. [188.216.175.96])
        by smtp.gmail.com with ESMTPSA id j11-20020a17090686cb00b0098e422d6758sm7964172ejy.219.2023.09.05.13.11.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Sep 2023 13:11:26 -0700 (PDT)
Message-ID: <fdd2ff37-8944-4186-844f-9698e8b2f31c@gmail.com>
Date: Tue, 5 Sep 2023 22:11:25 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Sergio Callegari <sergio.callegari@gmail.com>
Subject: Re: Regression with AX88179A: can't manually set MAC address anymore
To: netdev@vger.kernel.org
Cc: Linux Kernel Mailing list <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>
References: <54cb50af-b8e7-397b-ff7e-f6933b01a4b9@gmail.com>
 <ZPcfsd_QcJwQq0dK@debian.me>
Content-Language: en-US, it-IT
In-Reply-To: <ZPcfsd_QcJwQq0dK@debian.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 05/09/2023 14:31, Bagas Sanjaya wrote:
> On Tue, Sep 05, 2023 at 01:02:22PM +0200, Sergio Callegari wrote:
>> Hi, reporting here as the issue I am seeing is cross distro and relevant to
>> recent kernels. Hope this is appropriate.
>>
>> I have a USB hub with AX88179A ethernet. I was able to use it regularly,
>> until something changed in recent kernels to have this interface supported
>> by the cdc_ncm driver. After this change it is not possible anymore to work
>> with a manually set MAC address.
> Exactly on what version range?

Hard to say without extensive testing since distros move from kernel to 
kernel with big version jumps. The adapter was surely usable in ubuntu 
22.04 with kernel 5.15, breaking this Summer as kernel 6.2 arrived as an 
HWE kernel.

>> More details:
>>
>> - before the kernel changes, the interface was supported by a dedicated
>> kernel driver. The driver had glitches but was more or less working. The
>> main issue was that after some usage the driver stopped working. Could fix
>> these glitches with the driver at
>> https://github.com/nothingstopsme/AX88179_178A_Linux_Driver
> Did you mean that you use out-of-tree module?

I mean that with kernel 5.15 I could use the in-tree module with some 
glitches (interface occasionally stopping on teleconferencing) as well 
as the indicated out of tree module with no glitches.

With current kernels (certainly from 6.2 on) manually setting a MAC 
address breaks the interface. Furthermore, even if it compiles and loads 
fine, it is impossible to use the out of tree module because it does not 
create the eth device anymore (the eth device now appears with the 
cdc_ncn module). Being this an out of tree module, this is not very 
important, though.

>> - after the kernel changes, loading the ax88179_178a.ko does not create a
>> network device anymore. The interface can be used with the cdc_ncm driver,
>> however it is not possible anymore to use a manually set MAC address.
>>
>> When you manually set a MAC this appears to be accepted (e.g. ip link
>> reports it correctly), but the card does not receive data anymore. For
>> instance, trying to connect to a DHCP server, you see that the server
>> receives the request, makes an offer, but the offer is never received by the
>> network card.
>>
> How is the reproducer?

1. Turn down the interface with the `ip` command.

2. Use the `ip` command to set an hardware address (xx:xx:xx:xx:xx:xx) 
different from the original one (yy:yy:yy:yy:yy:yy) from the adapter.

3. Try to get an IP address from a DHCP server configured to respond to 
xx:xx:xx:xx:xx:xx

4. Observe that the system is unable to get an IP address from DHCP 
(keeps asking)

5. Look at the DHCP server logs and observe that the DHCP server 
receives the request from mac xx:xx:xx:xx:xx:xx and makes an offer, but 
this is never accepted (possibly never received).

Skipping 2. and setting the DHCP server to respond to yy:yy:yy:yy:yy:yy, 
everything works as expected. So it is the manual setting of an hardware 
address that triggers the issue. The DHCP server is OK: steps 1-5 work 
fine with other NICs and used to work fine with the AX88179A USB NIC 
with kernel 5.15.

Would like to triage better, but it is not easy for me since I do not 
own the USB Hubs containing the AX88179A based ethernet port. I get 
these where I work and I am not expected to detach them from the office 
equipment. I'll see what I can do.

>> This may be the same issue reported here:https://discussion.fedoraproject.org/t/ax88179-178a-network-fails-to-start-usb-to-eth/77687
>> where the user says he cannot use the adapter when Network Manager is
>> configured to employ a randomized MAC address.
>>
> Confused...

The discussion on the fedora forum that I linked is what provided me 
with a hint about the issue with the manual MAC address. In that 
discussion a user reports an issue about an AX88179A unusable in fedora 
(that uses fairly recent kernels). The user solved the issue disabling 
randomization of the MAC address (which implies changing the MAC). 
Namely he says "The wired connection had a “virtual mac address” 
randomly generated set in Network Manager GUI (I can’t remember why I 
had set that before) [...] disabling this configuration the wired 
connection started ok". However, the details are modest, so that user 
might as well had encountered an unrelated problem, pointing me to the 
manual MAC setting just by coincidence.

Thanks for your reply that testifies attention for the issue.

Sergio Callegari

