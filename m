Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217B61F163
	for <regressions@lists.linux.dev>; Thu, 13 Jul 2023 15:59:34 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-3fb4146e8deso8659285e9.0
        for <regressions@lists.linux.dev>; Thu, 13 Jul 2023 08:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689263973; x=1691855973;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vcdRoYEYVZcm3HXraXJGukOQRJRG22vmQSef1pPRzA0=;
        b=NSh6s0M82JFIHdinigFEY1e4wduhW2cWaGSp+8Fg5VB58ZIlmjnPEYVwXpDtxlxT/n
         lvfvyxN8ih8JfRghVpqDy1KEfpDFmDeWrl3Ee/Oo9fgnp2Sd20Ic62g88CsHwIovvnmC
         rp8K7GmCp58dEGvcjdJWL2z+Z6Bab1BXXi996dTvFc01Mfctc8ZSLNA5lzglv32TZXzj
         koCPuNNZ0zYPyon9cc4Y6QeTpY1eyfzokbq1zXwRjankId/6LKMyc8YQ8tRac3jdfzXH
         T5KDLsrKcLOrBa+4BpYLpcqFfIngajixExRUt3N4uB3S/E98RZLDjjXg7lmVf7mLbN3z
         O1uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689263973; x=1691855973;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vcdRoYEYVZcm3HXraXJGukOQRJRG22vmQSef1pPRzA0=;
        b=Q8VKROmdwtWnVErIOwSgcNajbmVv90eUGee2Tm9uy7guFWWYF9G+S2Q4yfiD0SpmID
         EtECy0wNjVbnmD+9lwXxNDCEIddGj+jQ+OG+4R6AHgYbhdZvOB2te2kkhW9zrvSHcaQm
         po7UeNwu9KEcr/4JQH+fnMBuOcW/WnZGblgg5dMb5AkWV1PbzpQy8A/aE0fPrEVxQAsD
         hPxQOGa8PHDoqk3rE0W6+QuuiqnxiiogbC46mKKrXiajI5ZzYlZxMvPuxXbVSqEOVjG1
         uXUC9esSacm8HE9vQ81Ww3eVop2iL/tVWffBu6PK2lPHB/XJ64aGfEo7NpxVy3Q+rPhO
         yVgw==
X-Gm-Message-State: ABy/qLYH3hvHK9+gYcijw9fWAiLz2ZepE4bXanibcK8F2GXbohaKjzLt
	a34gtlR8U5P4s7gtbhpYT4I=
X-Google-Smtp-Source: APBJJlH18etP5TBu++VzawykdEe3BIp4lvprTleBmUqqL/HEMB7ryqA7uJjUkWlmRcH8KRcF25lbVw==
X-Received: by 2002:a05:600c:2353:b0:3fc:8a:7c14 with SMTP id 19-20020a05600c235300b003fc008a7c14mr2075476wmq.18.1689263972636;
        Thu, 13 Jul 2023 08:59:32 -0700 (PDT)
Received: from ?IPV6:2a01:c23:b8ac:4400:f88a:e6ec:5092:791f? (dynamic-2a01-0c23-b8ac-4400-f88a-e6ec-5092-791f.c23.pool.telefonica.de. [2a01:c23:b8ac:4400:f88a:e6ec:5092:791f])
        by smtp.googlemail.com with ESMTPSA id t16-20020a5d49d0000000b003143bb5ecd5sm8326165wrs.69.2023.07.13.08.59.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jul 2023 08:59:32 -0700 (PDT)
Message-ID: <04dc4bbb-6bfd-4074-6d32-007dc8d213e5@gmail.com>
Date: Thu, 13 Jul 2023 17:59:31 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Kurt Kanzenbach <kurt@linutronix.de>,
 Tobias Klausmann <tobias.klausmann@freenet.de>,
 Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Realtek linux nic maintainers <nic_swsd@realtek.com>,
 netdev@vger.kernel.org
References: <c3465166-f04d-fcf5-d284-57357abb3f99@freenet.de>
 <CAFSsGVtiXSK_0M_TQm_38LabiRX7E5vR26x=cKags4ZQBqfXPQ@mail.gmail.com>
 <e47bac0d-e802-65e1-b311-6acb26d5cf10@freenet.de>
 <f7ca15e8-2cf2-1372-e29a-d7f2a2cc09f1@leemhuis.info>
 <CAFSsGVuDLnW_7iwSUNebx8Lku3CGZhcym3uXfMFnotA=OYJJjQ@mail.gmail.com>
 <A69A7D66-A73A-4C4D-913B-8C2D4CF03CE2@freenet.de>
 <842ae1f6-e3fe-f4d1-8d4f-f19627a52665@gmail.com> <87a5w0cn18.fsf@kurt>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: r8169: transmit transmit queue timed out - v6.4 cycle
In-Reply-To: <87a5w0cn18.fsf@kurt>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.07.2023 09:01, Kurt Kanzenbach wrote:
> Hello Heiner,
> 
> On Mon Jul 10 2023, Heiner Kallweit wrote:
>> On 05.07.2023 00:25, Tobias Klausmann wrote:
>>> Hi, top posting as well, as im on vacation, too. The system does not
>>> allow disabling ASPM, it is a very constrained notebook BIOS, thus
>>> the suggestion is nit feasible. All in all the sugesstion seems not
>>> favorable for me, as it is unknown how many systems are broken the
>>> same way. Having a workaround adviced as default seems oretty wrong
>>> to me.
>>>
>>
>> To get a better understanding of the affected system:
>> Could you please provide a full dmesg log and the lspci -vv output?
> 
> I'm having the same problem as described by Tobias on a desktop
> machine. v6.3 works; v6.4 results in transmit queue timeouts
> occasionally. Reverting 2ab19de62d67 ("r8169: remove ASPM restrictions
> now that ASPM is disabled during NAPI poll") "solves" the issue.
> 
> From dmesg:
> 
> |~ % dmesg | grep -i ASPM
> |[    0.152746] ACPI FADT declares the system doesn't support PCIe ASPM, so disable it
> |[    0.905100] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments MSI HPX-Type3]
> |[    0.906508] acpi PNP0A08:00: FADT indicates ASPM is unsupported, using BIOS configuration
> |[    1.156585] pci 10000:e1:00.0: can't override BIOS ASPM; OS doesn't have ASPM control
> |[    1.300059] r8169 0000:03:00.0: can't disable ASPM; OS doesn't have ASPM control
> 
> In addition, with commit 2ab19de62d67 in kernel regular messages like
> this show up:
> 
> |[ 7487.214593] pcieport 0000:00:1c.2: AER: Corrected error received: 0000:03:00.0
> 
> I'm happy to test any patches or provide more info if needed.
> 
Thanks for the report. It's interesting that the issue seems to occur only on systems
where BIOS doesn't allow OS to control ASPM. Maybe this results in the PCI subsystem
not properly initializing something.
Kurt/Klaus: Could you please boot with cmd line parameter pcie_aspm=force and see
whether this changes something?
This parameter lets Linux ignore the BIOS setting. You should see a message
"PCIe ASPM is forcibly enabled" in the dmesg log with this parameter.

> Thanks,
> Kurt

Heiner

