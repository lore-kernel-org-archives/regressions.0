Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5BA1851
	for <regressions@lists.linux.dev>; Fri, 26 Aug 2022 07:10:56 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id t12so710093wrm.8
        for <regressions@lists.linux.dev>; Fri, 26 Aug 2022 00:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=Wk6ASekOjGWHwzdPH/KW6aUNU4MlaS+85Ve1j+puKOs=;
        b=pRiDdYrLXUw1Ya7fKu91DJfxu/f9U+zY20DpJsAP/3OlSJYC5KaWEHNyJnaYzFQc48
         z3flwYnJbt6bloYLLyVTw2Ipo84/gxMtoqih0/GUnQjXytzYpvhm0Pgcggw5puSUnssP
         LHzIs0p6JVy+Z5jj3dVN77aXcPzmkb1iKGeNSdnhpnH6gmwFe91+GHsa2XOom7htPXHm
         jx9d8dzp2w6LZy9JaitpKWCXoZh6OSGyVZ2XPaGAJjGJ1T/kMDTSqy+Wa+crMLIxNEe2
         RN9pY2ASaJHZiMNYgV80Hjb1ep2B+y6xq9q2SsLA3Tc9zjnQoQVDokc5XQ7Q8f8IMrD3
         VRDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=Wk6ASekOjGWHwzdPH/KW6aUNU4MlaS+85Ve1j+puKOs=;
        b=AfrKvc2Tr7dfc+FsqhTNYHgQGmSBobGDis5OTY5csEuXLjZ2pVP3i4hVEpduFbOC+s
         SbIYCcdjxYos1H+IllEmj53pLXgjavpRHf6qplOgTbaAIW2ZWUoUQvuQKlju7auhFrHw
         hAW1Cy3wbQ1ucBNsG3YsuJpn7nRjwp0W/oHrtatW6/LVwrpTczCWYVnHgCkr+xqBt0lT
         /3FMQTCkk2Lr1oLnzyBYg5E+n5o56g9BP8/92hfjFbgXg/sPjEzKJf5O5LQtVzyJtdC4
         DXOQ4LAgdcaIWMSJ6HYqlmxG8UoQrWtIIDmOS7Qio/4z+o70JDuHigGK2sMhyRFloIiO
         /dfA==
X-Gm-Message-State: ACgBeo0EF94eI8ZasBNe4T04tSaDc0LkQEBd3717mpEy8gRtjfq54n6k
	TbO3eVjWrv7DuM+XeMl5Xio=
X-Google-Smtp-Source: AA6agR6HYkDFzvv+DZYPIluooIiwsEdYN6WtA/pbVnK/YCeizt1B9gg4wJjGMCCGvF6VtOhek+08RA==
X-Received: by 2002:a05:6000:2ce:b0:225:2c5f:3ba8 with SMTP id o14-20020a05600002ce00b002252c5f3ba8mr4205203wry.138.1661497854324;
        Fri, 26 Aug 2022 00:10:54 -0700 (PDT)
Received: from [192.168.178.21] (p4fc20ad4.dip0.t-ipconnect.de. [79.194.10.212])
        by smtp.gmail.com with ESMTPSA id t63-20020a1c4642000000b003a673055e68sm8552519wma.0.2022.08.26.00.10.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Aug 2022 00:10:53 -0700 (PDT)
Message-ID: <640aea69-963b-9846-8e71-959417b5615e@gmail.com>
Date: Fri, 26 Aug 2022 09:10:50 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [Bug 216373] New: Uncorrected errors reported for AMD GPU
Content-Language: en-US
To: Bjorn Helgaas <helgaas@kernel.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Cc: Xinhui Pan <Xinhui.Pan@amd.com>, regressions@lists.linux.dev,
 David Airlie <airlied@linux.ie>, linux-pci@vger.kernel.org,
 "Lazar, Lijo" <lijo.lazar@amd.com>, amd-gfx@lists.freedesktop.org,
 Tom Seewald <tseewald@gmail.com>, Kai-Heng Feng
 <kai.heng.feng@canonical.com>, Daniel Vetter <daniel@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>, Stefan Roese <sr@denx.de>
References: <20220825174845.GA2857385@bhelgaas>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20220825174845.GA2857385@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 25.08.22 um 19:48 schrieb Bjorn Helgaas:
> On Thu, Aug 25, 2022 at 10:18:28AM +0200, Christian König wrote:
>> Am 25.08.22 um 09:54 schrieb Lazar, Lijo:
>>> On 8/25/2022 1:04 PM, Christian König wrote:
>>>> Am 25.08.22 um 08:40 schrieb Stefan Roese:
>>>>> On 24.08.22 16:45, Tom Seewald wrote:
>>>>>> On Wed, Aug 24, 2022 at 12:11 AM Lazar, Lijo
>>>>>> <lijo.lazar@amd.com> wrote:
>>>>>>> Unfortunately, I don't have any NV platforms to test. Attached is an
>>>>>>> 'untested-patch' based on your trace logs.
>>>>>> ...
>>>>> I did not follow this thread in depth, but FWICT the bug is solved now
>>>>> with this patch. So is it correct, that the now fully enabled AER
>>>>> support in the PCI subsystem in v6.0 helped detecting a bug in the AMD
>>>>> GPU driver?
>>>> It looks like it, but I'm not 100% sure about the rational behind it.
>>>>
>>>> Lijo can you explain more on this?
>>>  From the trace, during gmc hw_init it takes this route -
>>>
>>> gart_enable -> amdgpu_gtt_mgr_recover -> amdgpu_gart_invalidate_tlb ->
>>> amdgpu_device_flush_hdp -> amdgpu_asic_flush_hdp (non-ring based HDP
>>> flush)
>>>
>>> HDP flush is done using remapped offset which is MMIO_REG_HOLE_OFFSET
>>> (0x80000 - PAGE_SIZE)
>>>
>>> WREG32_NO_KIQ((adev->rmmio_remap.reg_offset +
>>> KFD_MMIO_REMAP_HDP_MEM_FLUSH_CNTL) >> 2, 0);
>>>
>>> However, the remapping is not yet done at this point. It's done at a
>>> later point during common block initialization. Access to the unmapped
>>> offset '(0x80000 - PAGE_SIZE)' seems to come back as unsupported request
>>> and reported through AER.
>> That's interesting behavior. So far AER always indicated some kind of
>> transmission error.
>>
>> When that happens as well on unmapped areas of the MMIO BAR then we need to
>> keep that in mind.
> AER can log many different kinds of errors, some related to hardware
> issues and some related to software.
>
> PCI writes are normally posted and get no response, so AER is the main
> way to find out about writes to unimplemented addresses.
>
> Reads do get a response, of course, and reads to unimplemented
> addresses cause errors that most hardware turns into a ~0 data return
> (in addition to reporting via AER if enabled).

The issue is that previous hardware generations reported this through a 
device specific interrupt.

It's nice to see that this is finally standardized. I'm just wondering 
if we could retire our hardware specific interrupt handler for this as well.

Christian.

>
> Bjorn

