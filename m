Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66906257D
	for <regressions@lists.linux.dev>; Sun, 12 Mar 2023 14:37:28 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id e9-20020a056830200900b00694651d19f6so5446195otp.12
        for <regressions@lists.linux.dev>; Sun, 12 Mar 2023 07:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678631847;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=9INM4TDTMAD9Gf9W1iTVuuHtXKjZdr038kwz9Q3ffwU=;
        b=TyFz8Tl95qzNc4fzLEInwXyATXRNHR+tP/f8Q+3bPiD6qQXxzNPKxifjJ0z0IDd/xB
         ljSvcYGSnZf5om8B3HGVhRvkOgI3Q7CK9lLs4sXeTT/b9Aov1UpiYCuvzAB6QRngm0TP
         qudycnJJ0g1NTqv+WsORVEKSfnpsWIK8cfEUh+pUzjgUElSAbP8FYYGNURf5Ykorv53V
         SohZKsmY84MDWJHfkfEvn3NMQZgY4MkIt3ZfYSRJZ//zX0xQY2wKjTISOkfpfpQcUa2n
         /vMWrf0qTeNDD5YbgBHRwzGwct2aZe42I9Mo4bdYfG74Xxe//2BDTjzdU/jXdyw5vxnE
         YV0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678631847;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9INM4TDTMAD9Gf9W1iTVuuHtXKjZdr038kwz9Q3ffwU=;
        b=4gqmRNFcL3jwrsmwIZYpGP+10PSTfy+0oVPd0LhWR+1jEspzy5ZWmF3FWKc5lB6tU4
         btk7bm/bti5yA6iS9w1IMicMnZQFX6Uv02N0VHKde+ILrTskPSkwPxcHgaG6Ej2zRUpf
         NAN36ywah0iV6I+YdpmWmoIA3pu/vRa1QwIRTp0CpOPvClsDV5qVTwdcMhB0JvLkefpT
         mzfx4l2GST4zqQyxWCylS1s3gRi0vqn4xhvqNR8ntFslknh/vqUsJq/YyuSI08C80rwu
         fZC7xhRXqkavUyLaA8AEKxQGrdmoKqdiFid9frMUS2iu0cOjJitv5juksxV1lj3DbYB0
         KdGQ==
X-Gm-Message-State: AO0yUKWmAe1cUL7qVoY6vs35II05515rM8gGq2XlaAvGo9CuLYVbRuBL
	9uCQEA/Dr8X+GcUFpkMFg3QRDhctmCI=
X-Google-Smtp-Source: AK7set/5r1s/RbV8cEt68FRHgLqiT01Ytj0KGl7k0QLbkUq/OvdZL2izM31e0/ep3/tHaVsJyuH/0w==
X-Received: by 2002:a05:6830:4486:b0:694:3bee:529e with SMTP id r6-20020a056830448600b006943bee529emr19269571otv.33.1678631847172;
        Sun, 12 Mar 2023 07:37:27 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i18-20020a9d6112000000b0068bcef4f543sm2232608otj.21.2023.03.12.07.37.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Mar 2023 07:37:26 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <caed9824-c05d-19a9-d321-edefab17c4f0@roeck-us.net>
Date: Sun, 12 Mar 2023 07:37:24 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 8/8] btrfs: turn on -Wmaybe-uninitialized
Content-Language: en-US
To: Linux regressions mailing list <regressions@lists.linux.dev>,
 dsterba@suse.cz
Cc: Josef Bacik <josef@toxicpanda.com>, linux-btrfs@vger.kernel.org,
 kernel-team@fb.com
References: <cover.1671221596.git.josef@toxicpanda.com>
 <1d9deaa274c13665eca60dee0ccbc4b56b506d06.1671221596.git.josef@toxicpanda.com>
 <20230222025918.GA1651385@roeck-us.net>
 <20230222163855.GU10580@twin.jikos.cz>
 <6c308ddc-60f8-1b4d-28da-898286ddb48d@roeck-us.net>
 <feb05eef-cc80-2fbe-f28a-b778de73b776@leemhuis.info>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <feb05eef-cc80-2fbe-f28a-b778de73b776@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/12/23 06:06, Linux regression tracking (Thorsten Leemhuis) wrote:
> On 22.02.23 18:18, Guenter Roeck wrote:
>> On 2/22/23 08:38, David Sterba wrote:
>>> On Tue, Feb 21, 2023 at 06:59:18PM -0800, Guenter Roeck wrote:
>>>> On Fri, Dec 16, 2022 at 03:15:58PM -0500, Josef Bacik wrote:
>>>>> We had a recent bug that would have been caught by a newer compiler
>>>>> with
>>>>> -Wmaybe-uninitialized and would have saved us a month of failing tests
>>>>> that I didn't have time to investigate.
>>>>>
>>>>
>>>> Thanks to this patch, sparc64:allmodconfig and parisc:allmodconfig now
>>>> fail to commpile with the following error when trying to build images
>>>> with gcc 11.3.
>>>>
>>>> Building sparc64:allmodconfig ... failed
>>>> --------------
>>>> Error log:
>>>> <stdin>:1517:2: warning: #warning syscall clone3 not implemented [-Wcpp]
>>>> fs/btrfs/inode.c: In function 'btrfs_lookup_dentry':
>>>> fs/btrfs/inode.c:5730:21: error: 'location.type' may be used
>>>> uninitialized [-Werror=maybe-uninitialized]
>>>>    5730 |         if (location.type == BTRFS_INODE_ITEM_KEY) {
>>>>         |             ~~~~~~~~^~~~~
>>>> fs/btrfs/inode.c:5719:26: note: 'location' declared here
>>>>    5719 |         struct btrfs_key location;
>>>
>>> Thanks for the report, Linus warned me that there might be some fallouts
>>> and that the warning flag might need reverted. But before I do that I'd
>>> like to try to understand why the warnings happen in a code where is no
>>> reason for it.
>>>
>>> I did a quick test on gcc 11.3 (on x86_64, not on sparc64 unlike you
>>> report), and there is no warning
>>>
>>> gcc (SUSE Linux) 11.3.1 20220721 [revision
>>> a55184ada8e2887ca94c0ab07027617885beafc9]
>>> Copyright (C) 2021 Free Software Foundation, Inc.
>>> This is free software; see the source for copying conditions.  There
>>> is NO
>>> warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR
>>> PURPOSE.
>>>
>>>     DESCEND objtool
>>>     CALL    scripts/checksyscalls.sh
>>>     CC [M]  fs/btrfs/inode.o
>>>
>>> I.e. it's the same version, different arch and likely not the same
>>> config. In the function itself thre's a local variable passed by address
>>> to a static function in the same file.
>>>
>>>      struct btrfs_key location;
>>>      ...
>>>      ret = btrfs_inode_by_name(BTRFS_I(dir), dentry, &location, &di_type);
>>>
>>> and there it's
>>>
>>>      btrfs_dir_item_key_to_cpu(path->nodes[0], di, location);
>>>
>>> which is a series of helpers to read some data and store that to the
>>> strucutre. At some point there's a call to read_extent_buffer() that's
>>> in a different file.
>>>
>>> A local variable passed by address to external function is quite common
>>> so I'd expect more warnings and I don't see what's different in this
>>> case.
>>
>> Me not either. I also don't see the problem with other architectures, only
>> with sparc and parisc. It doesn't have to be gcc 11.3, though; it also
>> happens
>> with gcc 11.1, 11.2, 12.1, and 12.2 (tested on sparc).
>>
>> Too bad that gcc doesn't tell why exactly it believes that the object
>> may be uninitialized. Anyway, the following change would fix the problem.
>>
>> diff --git a/fs/btrfs/inode.c b/fs/btrfs/inode.c
>> index 6c18dc9a1831..4bab8ab39948 100644
>> --- a/fs/btrfs/inode.c
>> +++ b/fs/btrfs/inode.c
>> @@ -5421,7 +5421,7 @@ static int btrfs_inode_by_name(struct btrfs_inode
>> *dir, struct dentry *dentry,
>>                  return -ENOMEM;
>>
>>          ret = fscrypt_setup_filename(&dir->vfs_inode, &dentry->d_name,
>> 1, &fname);
>> -       if (ret)
>> +       if (ret < 0)
>>                  goto out;
>>
>> Presumably gcc assumes that fscrypt_setup_filename() could return
>> a positive value.
> 
> This discussion seems to have stalled, but from a kernelci report it
> looks like above warning still happens:
> https://lore.kernel.org/all/640bceb7.a70a0220.af8cd.146b@mx.google.com/
> 
> @btrfs developers, do you still have it on your radar?
> 
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> --
> Everything you wanna know about Linux kernel regression tracking:
> https://linux-regtracking.leemhuis.info/about/#tldr
> If I did something stupid, please tell me, as explained on that page.
> 
> #regzbot poke

There was a patch:

#regzbot monitor: https://patchwork.kernel.org/project/linux-btrfs/patch/dc091588d770923c3afe779e1eb512724662db71.1678290988.git.sweettea-kernel@dorminy.me/
#regzbot fix: btrfs: fix compilation error on sparc/parisc
#regzbot ignore-activity

Guenter

