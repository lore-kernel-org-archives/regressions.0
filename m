Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794626743;
	b=MfnAC1ROToxqGVE59ukQG2fkme1O0NN/ON+tvfI86PyTuhdQMdomPll3PLNMesLqZrjW
	 +sqhxeFYW9lj2QUDhr66E5vRnGDU0Kn9SBDfUMzGi+wQdA0sX3oSfBvjsACQK4oZDRwdG
	 YdqHKjAAyoaetFc7fGjWx6YP07zUxFGxbieeN5tZDSbzl1vPUUQp5x5twPMa0CGS3NOoN
	 SYwvT4pGXl/ysAider6OP2S3mA+OMX7/LAAEje2gdmYsCfMMgL86F0smWdVLR1XpO1UL1
	 KFSFXo72gccFEKTT9K1Phjylrrt4lLUllM5sw3+kh1ywwIeB25NzUFuKLHCCjaQXpqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794626743;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=gHv/pDEHGZwL/04gMWr3kX9bFGLJf7m3Va9lbS0UiIA=;
	b=g1YeaOytmkuAsK5plZDumQ4g/jrwRJIh0kT3q6DEUcIEDUH0ytURxDbSQVg3ijV0hHoF
	 AaLngipDfRYK69hZoc5Nb4NsuWpjDvxIM4Q/cxU8jeD2rMPY+b0tfY9yQbHzubgTcPlLP
	 ZUKx68jNT66x1uHnzGdIDfoOvkkZEfiNmpH07VHMD+b0j1S/6mlsC3wpyjXzfuLRnR5ua
	 usZ46ZbWsMewRKUdtYTvOzUpZuvekuRNFrvH/wHHglOS8m13vuwlLzXL9kZrnF4QlIZvt
	 +ahyHthPeYKV7IGD3Hjd9ABKkytq/DsqRt7YM5pPdde+m9cv2yGGFGp8vNMEcilMpvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=N054AAle;
	arc=none smtp.remote-ip=209.85.210.228
Received: from mail-pf1-f228.google.com (mail-pf1-f228.google.com [209.85.210.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB7D606A886
	for <regressions@lists.linux.dev>; Sat, 14 Nov 2026 03:25:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBB7D606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=N054AAle
Received: by mail-pf1-f228.google.com with SMTP id d2e1a72fcca58-8b5a6f2f27fso641697b3a.3
        for <regressions@lists.linux.dev>; Fri, 13 Nov 2026 19:25:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794626742; x=1795231542;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gHv/pDEHGZwL/04gMWr3kX9bFGLJf7m3Va9lbS0UiIA=;
        b=kQPHkOQ7r32T5LYAxkb38EE3lO6Lvdzi/yG1iBiylAjp2FJjaXkQHiOdz8rFEHrhij
         tKv8yy+VJRve06T2qgWbA81wim8kT/snpcc+Tuz31jMpnas31vNxtxKO8WxpPbU5VrBQ
         K4XRcWcETZ/GhZc95AuyLtRw5SkPoMI98HsTAnS+wX/FoMRYqo3On/HMxSKYdXIv7rHC
         yzrkFOoTrWYTN4pdWrzcWvAf2BIUK944SF1zifqimFnlSaEqY8AKKI5mza2jWB6ZDF84
         XzAZaJD9rJoKtaC4u6JlgtDNBS2jvnJNlzWIzPLAjjx5Pm603vQlxMsw0ejDeSosw9DY
         PUlQ==
X-Forwarded-Encrypted: i=1; AL+hErFtedAfHBDGJ3j6CH4S0HSaVQF7BUSL7kqVQ6Odihq0xgzDeukaSOT/q7FxcTBCjW4IgBJrA+03l8YEfg==@lists.linux.dev
X-Gm-Message-State: APuU4Z9/PimmRv1WAaccYB/NWhg2Ys7FuoxfxSfQjEcKginrBMBwkM5N
	eIVK4jR7GgyC3Y2GHq8kAiC2C9c9xq3HLwRcioFOTr0Ac36DERs1vEtoWw4KpIL1F7r9DTTbsA8
	9UDJESo0XI4GT5i8uuiiQlIpi0fZ6QAPw07l2nOjUpUf5bm1jw7+YcjeS1aAGUPhffdWIAVStU6
	ls570nuiUSmonLPckC+By1H5siGLoYZlbgfPZCiaClc7lPZ4ISMq1+mAuNdkJn1kEqjJ/o7cQZ1
	ObIEzLF9x5MW2fI70AqILA=
X-Gm-Gg: AYBFou0ABW7cG1u94vLC2ITFxZE1cooEBflAIFfCV8XIE20A5/SPnaQBbNDRaqkiq4r
	akjSFlfmsmxfsCHgrh6UCH181DALe9mDOA1p0DkX7FgWSC+Unb80Qz1/Xxn3Kud2PDu8Nj8PqoY
	Uvhl7QLsa2pqE8+mSzVAjA1PQUcbc7hojg57VZPtB0/aXComziHM5hfsshUHSxDphLFV3ja8a6o
	SghNpH/LdX9D9zCg5QqN6Z3crgiDqaYFk5tZZVFZ2rLJW22TLb28kT3F4/fuz64X3z9BYIwuA1W
	2UyRiK+blK112l6svy95o2gmHkaMk96WEOUzZsvoQpASolBmG1giHCWQBPxMgDt7cQgl4Z1X1uI
	2mOpN6cZ8K/p7y+nyfZCJy+O9cAab8v/xcNqFT5yfEyAJO+elrx+5QqTCzpWbtGBTn+QZHjWYeZ
	mIBMfB6gwY+qKy4D+neDlRwlg3PRxvjYG//YU4vxMs
X-Received: by 2002:a05:6a00:18a7:b0:886:5f48:3fca with SMTP id d2e1a72fcca58-8beb6780562mr4782476b3a.37.1794626742136;
        Fri, 13 Nov 2026 19:25:42 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-17.dlp.protect.broadcom.com. [144.49.247.17])
        by smtp-relay.gmail.com with ESMTPS id d2e1a72fcca58-8c04e3d8c94sm24045b3a.3.2026.11.13.19.25.40
        for <regressions@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:25:42 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36f479b9819so1895919eec.1
        for <regressions@lists.linux.dev>; Fri, 13 Nov 2026 19:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794626739; x=1795231539; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gHv/pDEHGZwL/04gMWr3kX9bFGLJf7m3Va9lbS0UiIA=;
        b=N054AAleNxiAv7IcghtqBuvLSfcFdohfNRohwx7ZwMkr7WJ9EnmE1xxaCdBwgzIiOF
         qbeUixgG6jNxTBADVjOQtF3dYufgaJGtAlSi9XiimNUqM2/SB8ye+BS5sHKx67D6yqgT
         x81h4M33QQWKLCpvv3xCfyGD0o+fnO8lnUN4Q=
X-Forwarded-Encrypted: i=1; AL+hErH/idTZhrX0mAn+5ETJkNSChema7jnmuL/ikd3npqIxnwqDq9p1V8+ds7LQH/3IDV0nM1d/7XU8FCUsuw==@lists.linux.dev
X-Received: by 2002:a05:7022:3a87:b0:19a:9a93:c9b2 with SMTP id a92af1059eb24-1b5030980f2mr4605130c88.13.1794626738953;
        Fri, 13 Nov 2026 19:25:38 -0800 (PST)
X-Received: by 2002:a05:7022:3a87:b0:19a:9a93:c9b2 with SMTP id a92af1059eb24-1b5030980f2mr4605093c88.13.1794626738111;
        Fri, 13 Nov 2026 19:25:38 -0800 (PST)
Received: from [192.168.10.3] (ip70-187-214-22.oc.oc.cox.net. [70.187.214.22])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955a1c5c2sm12632658eec.14.2026.11.13.19.25.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:25:37 -0800 (PST)
Message-ID: <96e08e3b-f034-4d69-8b6b-4a094cb39b25@broadcom.com>
Date: Fri, 13 Nov 2026 19:25:35 -0800
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/raspberrypi: vchiq: register bus at
 subsys_initcall
To: Martin Wetterwald <martin@wetterwald.eu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Jai Luthra <jai.luthra@ideasonboard.com>,
 Gaston Gonzalez <gascoar@gmail.com>, Stefan Wahren <wahrenst@gmx.net>,
 Phil Elwell <phil@raspberrypi.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Umang Jain <uajain@igalia.com>, Kees Cook <kees@kernel.org>,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev
References: <CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R272j6Bs4tg@mail.gmail.com>
 <20261022082927.59030-1-martin@wetterwald.eu>
 <2026102218-vowel-plutonium-629e@gregkh>
 <CAFERDQ1GeAwFGBQ09eu8p69c_b3_CzAeEfTwiEaVCG_22RQdtQ@mail.gmail.com>
 <CAFERDQ2fm9u-Y3DGTFNMH+K95gnE=aox1YogRWPwGFX+6Vrghg@mail.gmail.com>
Content-Language: en-US
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <CAFERDQ2fm9u-Y3DGTFNMH+K95gnE=aox1YogRWPwGFX+6Vrghg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e



On 11/13/2026 10:09 AM, 'Martin Wetterwald' via 
BCM-KERNEL-FEEDBACK-LIST,PDL wrote:
> On Wed, Nov 4, 2026 at 3:20 PM Martin Wetterwald <martin@wetterwald.eu> wrote:
>>
>> On Thu, Oct 22, 2026 at 3:31 PM Greg Kroah-Hartman
>> <gregkh@linuxfoundation.org> wrote:
>>>
>>> On Thu, Oct 22, 2026 at 10:29:24AM +0200, Martin Wetterwald wrote:
>>>> Hi Greg,
>>>> this is a regression introduced by aa125180c673 (via your tree) in
>>>> 6.19-rc1 and present in 6.19.y through 7.3.y. If the staging pull for
>>>> 7.4-rc1 has not been sent yet, could you take it there? Otherwise,
>>>> staging-linus would be great. Thanks!
>>>
>>> This is not a staging driver anymore, please route it through the proper
>>> tree after -rc1 is out.
>>>
>>> thanks,
>>>
>>> greg k-h
>>
>> Hi Florian,
>> Now that -rc1 is out, could you take the patch?
>>
>> I've checked 7.4-rc1 and I confirm the issue is still present.
>>
>> Thanks!
>> Martin
> 
> Hi Greg, Florian,
> 
> The file I changed (drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c)
> is currently listed with Florian as maintainer by get_maintainer.pl.
> But Florian tells me he doesn't maintain VCHIQ.
> 
> How to proceed now? This file doesn't seem to have any maintainer as far as I
> understand.
> Any pointer to someone able to take this patch would be appreciated.

Sorry for the lag Martin, I will be taking those patches from now on.
-- 
Florian

