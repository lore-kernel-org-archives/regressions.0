Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E53A922
	for <regressions@lists.linux.dev>; Thu, 19 Jan 2023 15:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674143650;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NKixzLypOUHed+5YivFO5OQBd4rbKABI3Pwsd4l4BBo=;
	b=DcEXjrTDLJ8cswvfmxUYZvU8tjEiQGhs4hOfel4qjoOsv4IknCUwriV0YSR3/LZQlHpVLx
	kn0Xc98jvIhzcWv0geb1Ab4SYuREQibZ/9Htkwd8vq1GjI3V8PrF16+/6YG91j9PBXrHdq
	+HzANKDQC2WNK3n4sBVtS4j/BC/QlPE=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-633-P6DM00TVN3S-al_fUWOnXg-1; Thu, 19 Jan 2023 10:54:07 -0500
X-MC-Unique: P6DM00TVN3S-al_fUWOnXg-1
Received: by mail-ej1-f71.google.com with SMTP id dr5-20020a170907720500b00808d17c4f27so1885876ejc.6
        for <regressions@lists.linux.dev>; Thu, 19 Jan 2023 07:54:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NKixzLypOUHed+5YivFO5OQBd4rbKABI3Pwsd4l4BBo=;
        b=utK/DUUsY7vObhW3RR3BkZJT/nMa2h9aIkzEYKAFW1eH+GfppdX90HCL3KFEYgdZHZ
         kGuG8ekbVYqBvbVeA31pSV+IXlEFWX5s7hOMDS2PqEQ6RFwj6WjAHtKMFh1vyYMo14uV
         yGihZW2sWO5zNmXc92NKPbTwnVoUixX677S/DaNs/cOf/1bobApMAZeVbqPZ3tj+gZGG
         UjmQxm0+SX0sRGrd5I7C0jnZQfYXGPwdD5UtvDW3Hg2vy26e9n/OvWMNLgpti0PV8WxM
         3A7W+2eDuu9xL07A9YNaftVUNhHLi2o+H2TQvcIKxpj0XKATBavkAqzLHfwESwuhDzGP
         ivfQ==
X-Gm-Message-State: AFqh2krj+XMGnvLVpsk4bDAIvUJbuqEE7lbW1fBp/o81YSvKv9NdpyjC
	nU95W7m5VxGV2Xr4ZOEpQeaJvmrrh39kHr9+z4YyHWVEaW5/Pjo04+gTqpidyiRg6N++jnGOM0A
	rXujknQCduEwtcaeu5k+SCfkkYfjH2BeJVIGVlZ5Iri+NYagrh1qob50jbsO282p/nKO74674rE
	c=
X-Received: by 2002:a17:906:918:b0:877:7199:88df with SMTP id i24-20020a170906091800b00877719988dfmr3043808ejd.33.1674143645934;
        Thu, 19 Jan 2023 07:54:05 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsbHXGd05f9cZr9Sg99LSyrcZe7Lu36gjT+gq+7mnp+hqBGJEBQpuO5W+G7CXW3L9beGjD3Kw==
X-Received: by 2002:a17:906:918:b0:877:7199:88df with SMTP id i24-20020a170906091800b00877719988dfmr3043789ejd.33.1674143645613;
        Thu, 19 Jan 2023 07:54:05 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id sb25-20020a1709076d9900b007b2a58e31dasm16690470ejc.145.2023.01.19.07.54.04
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 07:54:05 -0800 (PST)
Message-ID: <1890f2f1-ffe7-91ae-931d-253bdbbf520e@redhat.com>
Date: Thu, 19 Jan 2023 16:54:04 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: linux-6.2-rc4+ hangs on poweroff/reboot: Bisected
To: Linux regressions mailing list <regressions@lists.linux.dev>
References: <b64705e3-2e63-a466-f829-f9568b06766a@googlemail.com>
 <fcec3c78-b5d9-eb48-0fc0-d1f27de87f23@leemhuis.info>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <fcec3c78-b5d9-eb48-0fc0-d1f27de87f23@leemhuis.info>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Thorsten,

<deliberate offlist remark>

On 1/19/23 15:33, Linux kernel regression tracking (Thorsten Leemhuis) wrote:
> [adding various lists and the two other nouveau maintainers to the list
> of recipients]
> 
> For the rest of this mail:
> 
> [TLDR: I'm adding this report to the list of tracked Linux kernel
> regressions; the text you find below is based on a few templates
> paragraphs you might have encountered already in similar form.
> See link in footer if these mails annoy you.]
> 
> On 18.01.23 21:59, Chris Clayton wrote:
>> Hi.
>>
>> I build and installed the lastest development kernel earlier this week. I've found that when I try the laptop down (or
>> reboot it), it hangs right at the end of closing the current session. The last line I see on  the screen when rebooting is:
>>
>> 	sd 4:0:0:0: [sda] Synchronising SCSI cache
>>
>> when closing down I see one additional line:
>>
>> 	sd 4:0:0:0 [sda]Stopping disk
>>
>> In both cases the machine then hangs and I have to hold down the power button fot a few seconds to switch it off.
>>
>> Linux 6.1 is OK but 6.2-rc1 hangs, so I bisected between this two and landed on:
>>
>> 	# first bad commit: [0e44c21708761977dcbea9b846b51a6fb684907a] drm/nouveau/flcn: new code to load+boot simple HS FWs
>> (VPR scrubber)
>>
>> I built and installed a kernel with f15cde64b66161bfa74fb58f4e5697d8265b802e (the parent of the bad commit) checked out
>> and that shuts down and reboots fine. It the did the same with the bad commit checked out and that does indeed hang, so
>> I'm confident the bisect outcome is OK.
>>
>> Kernels 6.1.6 and 5.15.88 are also OK.
>>
>> My system had dual GPUs - one intel and one NVidia. Related extracts from 'lscpi -v' is:
>>
>> 00:02.0 VGA compatible controller: Intel Corporation CometLake-H GT2 [UHD Graphics] (rev 05) (prog-if 00 [VGA controller])
>>         Subsystem: CLEVO/KAPOK Computer CometLake-H GT2 [UHD Graphics]
>>
>>         Flags: bus master, fast devsel, latency 0, IRQ 142
>>
>>         Memory at c2000000 (64-bit, non-prefetchable) [size=16M]
>>
>>         Memory at a0000000 (64-bit, prefetchable) [size=256M]
>>
>>         I/O ports at 5000 [size=64]
>>
>>         Expansion ROM at 000c0000 [virtual] [disabled] [size=128K]
>>
>>         Capabilities: [40] Vendor Specific Information: Len=0c <?>
>>
>>         Capabilities: [70] Express Root Complex Integrated Endpoint, MSI 00
>>
>>         Capabilities: [ac] MSI: Enable+ Count=1/1 Maskable- 64bit-
>>
>>         Capabilities: [d0] Power Management version 2
>>
>>         Kernel driver in use: i915
>>
>>         Kernel modules: i915
>>
>>
>> 01:00.0 VGA compatible controller: NVIDIA Corporation TU117M [GeForce GTX 1650 Ti Mobile] (rev a1) (prog-if 00 [VGA
>> controller])
>>         Subsystem: CLEVO/KAPOK Computer TU117M [GeForce GTX 1650 Ti Mobile]
>>         Flags: bus master, fast devsel, latency 0, IRQ 141
>>         Memory at c4000000 (32-bit, non-prefetchable) [size=16M]
>>         Memory at b0000000 (64-bit, prefetchable) [size=256M]
>>         Memory at c0000000 (64-bit, prefetchable) [size=32M]
>>         I/O ports at 4000 [size=128]
>>         Expansion ROM at c3000000 [disabled] [size=512K]
>>         Capabilities: [60] Power Management version 3
>>         Capabilities: [68] MSI: Enable+ Count=1/1 Maskable- 64bit+
>>         Capabilities: [78] Express Legacy Endpoint, MSI 00
>>         Kernel driver in use: nouveau
>>         Kernel modules: nouveau
>>
>> DRI_PRIME=1 is exported in one of my init scripts (yes, I am still using sysvinit).
>>
>> I've attached the bisect.log, but please let me know if I can provide any other diagnostics. Please cc me as I'm not
>> subscribed.
> 
> Thanks for the report. To be sure the issue doesn't fall through the
> cracks unnoticed, I'm adding it to regzbot, the Linux kernel regression
> tracking bot:
> 
> #regzbot ^introduced e44c2170876197

You dropped a leading 0 here (should be 0e44c2170876197) and
at for various tools this leading 0 matters, e.g.:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e44c2170876197

does not work because of the missing 0 and neither does:

git format-patch e44c2170876197~..e44c2170876197

Regards,

Hans


