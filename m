Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581BB364A4
	for <regressions@lists.linux.dev>; Fri, 24 Nov 2023 16:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="aMoOrZE+"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1cf88973da5so4638995ad.0
        for <regressions@lists.linux.dev>; Fri, 24 Nov 2023 08:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1700843468; x=1701448268; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k2ogGIIqsJnNxaKdE/EV3GmBwVysZZUvGiQa42glbgM=;
        b=aMoOrZE+n6ugj5Xxy32yh8l8hGyIgay0uPPGdSsqitm8gITiJC8v84uycVqLc5aZ6+
         6Lg14R4ikXdnTCS/8b5ABw9QxtVdzP6JDO2Wo9yHUbIrm/wHpMZimEnLDkFMJuzwTz/x
         Rjpp+jzqj+ErEEvV/U1oXkkJfQ7hQ4dpsZGD+FUNU4b1iXnDiQLouCJM7CVjJhDHJQr+
         L0DjjhEVYLgCUkTMn3Qx0upwDX1yr+58KoUF1F2NgklvKJqWl70861OfnUcF5b+wN0VJ
         Mk0i9CJjB1Ugh4MKHtPN1Z2IbWsHk/EXp4T8rNWFv4kQL51ko+FvGb0Cx+J+S5ObRcaM
         CfBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700843468; x=1701448268;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k2ogGIIqsJnNxaKdE/EV3GmBwVysZZUvGiQa42glbgM=;
        b=bPXyG+aWHHhB/mi8QyaiqLIbLrCDEeE84xOrTTitVxZj3zZPEfJB9CPEscdaYYU8Nf
         xrAGpavC+Tp9BB+eS+aa9GjLTQj+f+OOfE8doNX09ha+5RiItcSGhfc0oCDxP5SxduNw
         WwHGkYqE6GzvZ8n+4lKSRcWtexSjwYZ6zslnC7F2g6mANJYBgsMb5m90bK6JsOTqq3kt
         OQflNuFyNfqq21I2k9T5J72kEREA9cz9f5JP2Gh4hNWRgkrCJnGTJpzaZyNsOxz6t6KF
         pYlf5CFk0LUee9NIvLJRUW0P9UtJ/wET2QM3l5zqE1XJesl7j4P3diGVINylsps6Frze
         hHjQ==
X-Gm-Message-State: AOJu0YxKLPDFjICAxz3XUEeihul+OMiqjHeMcPjl9EP20T38HjfQZ9Ic
	T/pyFl4YLitcthZG3pOS/WRaa2rEqmEs8uhsKLcEXA==
X-Google-Smtp-Source: AGHT+IFNObCJRl0SKfGH6WCHQp0So/whqwRMHhseJv204YOu3haZzBIwFSUaACfhr4bRIsLvfx55mA==
X-Received: by 2002:a17:902:ced0:b0:1cf:658f:d2d with SMTP id d16-20020a170902ced000b001cf658f0d2dmr3594550plg.5.1700843468319;
        Fri, 24 Nov 2023 08:31:08 -0800 (PST)
Received: from [192.168.1.150] ([198.8.77.194])
        by smtp.gmail.com with ESMTPSA id x5-20020a1709029a4500b001c407fac227sm3371578plv.41.2023.11.24.08.31.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Nov 2023 08:31:07 -0800 (PST)
Message-ID: <54706535-208b-43b5-814f-570ffa7b29bb@kernel.dk>
Date: Fri, 24 Nov 2023 09:31:05 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bcache: revert replacing IS_ERR_OR_NULL with IS_ERR
Content-Language: en-US
To: Coly Li <colyli@suse.de>, Markus Weippert <markus@gekmihesg.de>
Cc: Bcache Linux <linux-bcache@vger.kernel.org>,
 Thorsten Leemhuis <regressions@leemhuis.info>, Zheng Wang
 <zyytlz.wz@163.com>, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Stefan_F=C3=B6rster?= <cite@incertum.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <ZV9ZSyDLNDlzutgQ@pharmakeia.incertum.net>
 <be371028-efeb-44af-90ea-5c307f27d4c6@leemhuis.info>
 <71576a9ff7398bfa4b8c0a1a1a2523383b056168.camel@gekmihesg.de>
 <989C39B9-A05D-4E4F-A842-A4943A29FFD6@suse.de>
 <1c2a1f362d667d36d83a5ba43218bad199855b11.camel@gekmihesg.de>
 <3DF4A87A-2AC1-4893-AE5F-E921478419A9@suse.de>
 <c47d3540ece151a2fb30e1c7b5881cb8922db915.camel@gekmihesg.de>
 <B68E455A-D6EB-4BB9-BD60-F2F8C3C8C21A@suse.de>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <B68E455A-D6EB-4BB9-BD60-F2F8C3C8C21A@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/24/23 9:29 AM, Coly Li wrote:
> 
> 
>> 2023?11?24? 23:14?Markus Weippert <markus@gekmihesg.de> ???
>>
>> Commit 028ddcac477b ("bcache: Remove unnecessary NULL point check in
>> node allocations") replaced IS_ERR_OR_NULL by IS_ERR. This leads to a
>> NULL pointer dereference.
>>
>> BUG: kernel NULL pointer dereference, address: 0000000000000080
>> Call Trace:
>> ? __die_body.cold+0x1a/0x1f
>> ? page_fault_oops+0xd2/0x2b0
>> ? exc_page_fault+0x70/0x170
>> ? asm_exc_page_fault+0x22/0x30
>> ? btree_node_free+0xf/0x160 [bcache]
>> ? up_write+0x32/0x60
>> btree_gc_coalesce+0x2aa/0x890 [bcache]
>> ? bch_extent_bad+0x70/0x170 [bcache]
>> btree_gc_recurse+0x130/0x390 [bcache]
>> ? btree_gc_mark_node+0x72/0x230 [bcache]
>> bch_btree_gc+0x5da/0x600 [bcache]
>> ? cpuusage_read+0x10/0x10
>> ? bch_btree_gc+0x600/0x600 [bcache]
>> bch_gc_thread+0x135/0x180 [bcache]
>>
>> The relevant code starts with:
>>
>>    new_nodes[0] = NULL;
>>
>>    for (i = 0; i < nodes; i++) {
>>        if (__bch_keylist_realloc(&keylist, bkey_u64s(&r[i].b->key)))
>>            goto out_nocoalesce;
>>    // ...
>> out_nocoalesce:
>>    // ...
>>    for (i = 0; i < nodes; i++)
>>        if (!IS_ERR(new_nodes[i])) {  // IS_ERR_OR_NULL before
>> 028ddcac477b
>>            btree_node_free(new_nodes[i]);  // new_nodes[0] is NULL
>>            rw_unlock(true, new_nodes[i]);
>>        }
>>
>> This patch replaces IS_ERR() by IS_ERR_OR_NULL() to fix this.
>>
>> Fixes: 028ddcac477b ("bcache: Remove unnecessary NULL point check in
>> node allocations")
>> Link:
>> https://lore.kernel.org/all/3DF4A87A-2AC1-4893-AE5F-E921478419A9@suse.de/
>> Cc: stable@vger.kernel.org
>> Cc: Zheng Wang <zyytlz.wz@163.com>
>> Cc: Coly Li <colyli@suse.de>
>> Signed-off-by: Markus Weippert <markus@gekmihesg.de>
> 
> Added into my for-next.  Thanks for patching up.

We should probably get this into the current release, rather than punt
it to 6.8.

-- 
Jens Axboe

