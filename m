Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11447A
	for <regressions@lists.linux.dev>; Wed, 15 Jun 2022 17:50:35 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id a10so11877855pju.3
        for <regressions@lists.linux.dev>; Wed, 15 Jun 2022 10:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=QfCF2UsmU1Pniv5Pf4uVgOiwJRRieSBYhaM8CMSmQ3U=;
        b=Pdshfu1RKVhPNis08umwmUUzhrIzuI1qOJCBow86aXNtlNrNUkQkaCWDO89gmAgj6v
         PoUjEwLg6MO5uM5qbb4DM5WmtipAbO4F/NrF7yjVysoPoGDCANnsAlG5f8A4TIkPgAnr
         ZX3rmGkJHMi0g1gmWoEXhtwYVEJdKAmVAGmT2pgQ+WjgZnFJRHc9Uy0zkzI3K9PMma7K
         MXuDZ3DtadPA/iculyZSRPJxHQXMg9lvYR/nSaej8PqYXcPEhFS1othMR7b1sJxvqbQX
         KbkApuBpzlgRt7lA3TmFwIM+PaXj7jNMYGyv2PiJT5fl3fLOFlr5cvnyf7FinSFNGMcu
         K2hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=QfCF2UsmU1Pniv5Pf4uVgOiwJRRieSBYhaM8CMSmQ3U=;
        b=21CvB+TguceMSjKbVtOns/jvaASR8OeSlp+UeHtOtp4Djygx2AE+AsPmbUnqHjnj+L
         blaJrtSUHMbMt3NggLpy22/7IZ5Bhj/Qdl90GDQAGFKCrI33as+fnn1tlQXKlryd8HK0
         C1NaWREQtQWxJfMuzNWfp/njg7jMZ5n6067FxlBmPCaJiWzeJ1XuzLdR6DOtXxC/mGfD
         2bWTU6WwCbCYuVr3lIjxZK9jfckYsfrSbPc+jjnTwPigK4wWv2ytjLYXfgjuakQmc2k/
         CxQsrSJL9/Al9WCGPMzGH0QJoh+0Pphw7ZdaE9KdECHumB9bc//eSI8/ETlb/Pm8npGa
         XBEg==
X-Gm-Message-State: AJIora93HeAs/265CPF4r+vWPRfIC5GkPs1e/yalRehYFYfoORcbcn6l
	JfHsOOvOV7wydaXArrneLlw=
X-Google-Smtp-Source: AGRyM1tuUWVOE9TzgSzU74eaIcQ/ZeNW5GN0XVRmVm0PRdEBUdPkL2L0CmPF+4r9OP3XWrBQYluWYQ==
X-Received: by 2002:a17:90b:3654:b0:1ea:4540:d32 with SMTP id nh20-20020a17090b365400b001ea45400d32mr11452858pjb.92.1655315435252;
        Wed, 15 Jun 2022 10:50:35 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h13-20020a17090a3d0d00b001ea5d9ae7d9sm2067433pjc.40.2022.06.15.10.50.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jun 2022 10:50:34 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <50eeff2e-45c5-5eb2-c41d-3e0092a84483@roeck-us.net>
Date: Wed, 15 Jun 2022 10:50:32 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 5.4 26/34] dm verity: set DM_TARGET_IMMUTABLE feature flag
Content-Language: en-US
To: Mike Snitzer <snitzer@kernel.org>
Cc: Greg KH <gregkh@linuxfoundation.org>, keescook@chromium.org,
 sarthakkukreti@google.com, stable@vger.kernel.org,
 Oleksandr Tymoshenko <ovt@google.com>, dm-devel@redhat.com,
 regressions@lists.linux.dev
References: <20220603173816.944766454@linuxfoundation.org>
 <20220610042200.2561917-1-ovt@google.com> <YqLTV+5Q72/jBeOG@kroah.com>
 <YqNfBMOR9SE2TuCm@redhat.com> <Yqb/sT205Lrhl6Bv@kroah.com>
 <20220615143642.GA2386944@roeck-us.net> <Yqn64AMwoIzQXwXM@redhat.com>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <Yqn64AMwoIzQXwXM@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/15/22 08:29, Mike Snitzer wrote:
> On Wed, Jun 15 2022 at 10:36P -0400,
> Guenter Roeck <linux@roeck-us.net> wrote:
> 
>> On Mon, Jun 13, 2022 at 11:13:21AM +0200, Greg KH wrote:
>>> On Fri, Jun 10, 2022 at 11:11:00AM -0400, Mike Snitzer wrote:
>>>> On Fri, Jun 10 2022 at  1:15P -0400,
>>>> Greg KH <gregkh@linuxfoundation.org> wrote:
>>>>
>>>>> On Fri, Jun 10, 2022 at 04:22:00AM +0000, Oleksandr Tymoshenko wrote:
>>>>>> I believe this commit introduced a regression in dm verity on systems
>>>>>> where data device is an NVME one. Loading table fails with the
>>>>>> following diagnostics:
>>>>>>
>>>>>> device-mapper: table: table load rejected: including non-request-stackable devices
>>>>>>
>>>>>> The same kernel works with the same data drive on the SCSI interface.
>>>>>> NVME-backed dm verity works with just this commit reverted.
>>>>>>
>>>>>> I believe the presence of the immutable partition is used as an indicator
>>>>>> of special case NVME configuration and if the data device's name starts
>>>>>> with "nvme" the code tries to switch the target type to
>>>>>> DM_TYPE_NVME_BIO_BASED (drivers/md/dm-table.c lines 1003-1010).
>>>>>>
>>>>>> The special NVME optimization case was removed in
>>>>>> 5.10 by commit 9c37de297f6590937f95a28bec1b7ac68a38618f, so only 5.4 is
>>>>>> affected.
>>>>>>
>>>>>
>>>>> Why wouldn't 4.9, 4.14, and 4.19 also be affected here?  Should I also
>>>>> just queue up 9c37de297f65 ("dm: remove special-casing of bio-based
>>>>> immutable singleton target on NVMe") to those older kernels?  If so,
>>>>> have you tested this and verified that it worked?
>>>>
>>>> Sorry for the unforeseen stable@ troubles here!
>>>>
>>>> In general we'd be fine to apply commit 9c37de297f65 but to do it
>>>> properly would require also making sure commits that remove
>>>> "DM_TYPE_NVME_BIO_BASED", like 8d47e65948dd ("dm mpath: remove
>>>> unnecessary NVMe branching in favor of scsi_dh checks") are applied --
>>>> basically any lingering references to DM_TYPE_NVME_BIO_BASED need to
>>>> be removed.
>>>>
>>>> The commit header for 8d47e65948dd documents what
>>>> DM_TYPE_NVME_BIO_BASED was used for.. it was dm-mpath specific and
>>>> "nvme" mode really never got used by any userspace that I'm aware of.
>>>>
>>>> Sadly I currently don't have the time to do this backport for all N
>>>> stable kernels... :(
>>>>
>>>> But if that backport gets out of control: A simpler, albeit stable@
>>>> unicorn, way to resolve this is to simply revert 9c37de297f65 and make
>>
>> 9c37de297f65 can not be reverted in 5.4 and older because it isn't there,
>> and trying to apply it results in conflicts which at least I can not
>> resolve.
>>
>>>> it so that DM-mpath and DM core just used bio-based if "nvme" is
>>>> requested by dm-mpath, so also in drivers/md/dm-mpath.c e.g.:
>>>>
>>>> @@ -1091,8 +1088,6 @@ static int parse_features(struct dm_arg_set *as, struct multipath *m)
>>>>
>>>>                          if (!strcasecmp(queue_mode_name, "bio"))
>>>>                                  m->queue_mode = DM_TYPE_BIO_BASED;
>>>> 			else if (!strcasecmp(queue_mode_name, "nvme"))
>>>> -                               m->queue_mode = DM_TYPE_NVME_BIO_BASED;
>>>> +                               m->queue_mode = DM_TYPE_BIO_BASED;
>>>>                          else if (!strcasecmp(queue_mode_name, "rq"))
>>>>                                  m->queue_mode = DM_TYPE_REQUEST_BASED;
>>>>                          else if (!strcasecmp(queue_mode_name, "mq"))
>>>>
>>>> Mike
>>>>
>>>
>>> Ok, please submit a working patch for the kernels that need it so that
>>> we can review and apply it to solve this regression.
>>>
>>
>> So, effectively, v5.4.y and older are broken right now for use cases
>> with dm on NVME drives.
>>
>> Given that the regression does affect older branches, and given that we
>> have to revert this patch to avoid regressions in ChromeOS, would it be
>> possible to revert it from v5.4.y and older until a fix is found ?
> 
> I obviously would prefer to not have this false-start.
> 
The false start has already happened since we had to revert the patch
from chromeos-5.4 and older branches.

Guenter
