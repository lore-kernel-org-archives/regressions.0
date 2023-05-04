Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841B0FC1E
	for <regressions@lists.linux.dev>; Thu,  4 May 2023 16:44:41 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-763af6790a3so4516339f.0
        for <regressions@lists.linux.dev>; Thu, 04 May 2023 09:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20221208.gappssmtp.com; s=20221208; t=1683218680; x=1685810680;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RldMxRu/eCeUoOgwIk9gehyNreGKl8U4r7xfbeXdGLk=;
        b=gU503mwUGDgvk+ob6edwahv5IgBmP7ZtABLqT6FPLZO7zKK1IskehUe3xVTWnfHAer
         2GNQ6R1WgeObwkRXPElf2IRADlJ2RKBOmcwCBcmuWhO8+Gf33wDYQrPm2PeE9cwjKGm7
         1OCO8hT67pAfXiTKkAFr2mKExEMqV4ZEIGxK/biH2fNi4LT1B9RTkxtn3RTwfheUNTIL
         j4ropzYAbeRCuDJ6m/CRWHRMHkmmadk1taXK+N105YYs4jbCE92pd830QdorGNc6n6pa
         s5Mr3FOZgEpUqYvb48dd5Ac1yNhVqQToWjDbzYalgM7vIxxHa2RO6ntIpdJ4RItv5/LI
         1rvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683218680; x=1685810680;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RldMxRu/eCeUoOgwIk9gehyNreGKl8U4r7xfbeXdGLk=;
        b=TcUIuOxSaYS8sn60HZ+CAoSipmPnsDMg6AZ1cdCfhcHCou5EFsLaYT7hswsLQ+snLO
         S062yAt5P5b0JkPXwG4Aug4f5v4X8URxnERErGoZssEb9ENKtQav9rGnJg8sRK7X1eyo
         1GqlH22Caslu+5bkT674MhBKO1uoAVlToChUifV7t7U4oi9gt7YvfaAUQ0aytN8K/nXR
         Peyfu9cr1qZ8ou88zH3rwpaPiNsiVEcOgmu/bcRRCMubi9j4x0eYJ/E35dxewNeB9GXJ
         29hA0D3oJF+XHelatZs3otbKnJvCQs/CRjq8+tXonaR0+h0MU7kIZU6IpGGPbyzwHmkb
         vFLg==
X-Gm-Message-State: AC+VfDxRLaDvV4f82pSnEdhTvc0roRVeDfkhp2YlwSR+1wHqFolufQEl
	aYb103g6GUB2bzppRRzOOa3Q1w==
X-Google-Smtp-Source: ACHHUZ5prRsEWmIhj5kFGb/cvDO1yaOeYY5WSRuaeVPJa7Z898cL5o2X7LzPPTIx95hwtUQnda+dVQ==
X-Received: by 2002:a05:6602:4089:b0:760:ed2e:cc32 with SMTP id bl9-20020a056602408900b00760ed2ecc32mr11841776iob.2.1683218680379;
        Thu, 04 May 2023 09:44:40 -0700 (PDT)
Received: from [192.168.1.94] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id y24-20020a027318000000b0040fbc31614esm10675095jab.54.2023.05.04.09.44.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 May 2023 09:44:39 -0700 (PDT)
Message-ID: <b9acff08-913b-55cc-75dd-4a1bbe63e330@kernel.dk>
Date: Thu, 4 May 2023 10:44:38 -0600
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: Hang loading initrd since last Friday.
Content-Language: en-US
To: Raghavendra K T <raghavendra.kt@amd.com>,
 Ben Greear <greearb@candelatech.com>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 Bagas Sanjaya <bagasdotme@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <9d87defc-5376-d690-b483-bc314e4f568b@candelatech.com>
 <ZFHHh/m0pkOYIzo7@debian.me>
 <ebb280e4-d381-0bf8-d134-0318c5cfdf83@leemhuis.info>
 <f12a8f23-5aac-b615-300c-38001b9583c2@candelatech.com>
 <835c3de6-7460-226c-96e7-839aeef6064e@amd.com>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <835c3de6-7460-226c-96e7-839aeef6064e@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 5/4/23 10:38 AM, Raghavendra K T wrote:
> On 5/4/2023 5:19 AM, Ben Greear wrote:
>> On 5/2/23 21:46, Linux regression tracking (Thorsten Leemhuis) wrote:
>>> On 03.05.23 04:31, Bagas Sanjaya wrote:
>>>> On Tue, May 02, 2023 at 02:03:33PM -0700, Ben Greear wrote:
>>>>>
>>>>> Pulling today's upstream 6.3+ tree, my system now hangs loading initrd.
>>>
>>> Just to understand this properly: you mean after the boot loader said it
>>> loaded the initramfs, not when the kernel starts using it?
>>
>> I am bisecting...it appears to be .config related.  If I skip enabling things
>> during bisect, then I do not see the problem.  But I copied my original buggy .config
>> into an otherwise good kernel commit, and now it fails.  I'm manually bisecting
>> the .config settings....
>>
>> Thanks,
>> Ben
>>
> 
> Hello Ben,
> 
> (CCing Jens here)
> 
> I was facing same issue too. Surprising I did not hit the same on the
> guest VM.
> 
> After bisecting, found that Reverting
> [9f4107b07b17b5ee68af680150f91227bea2df6f] block: store bdev->bd_disk->fops->submit_bio state in bdev
> 
> Helped me to boot back the system. Can you please confirm

Can you try and pull:

git://git.kernel.dk/linux for-6.4/block

into current -git and see if that works for you? There's a fix for that
commit in there.

-- 
Jens Axboe


