Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364A21C6B4
	for <regressions@lists.linux.dev>; Sun,  5 Jan 2025 14:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736088701; cv=none; b=AJeWj7w6uo2eOpMFbG5pWNRCzUA+usihDql8oY3wmO/eHvl6hpZc5bpfuxRNH1BPcurxVVi2OXxjCSgxtIKPfakwjItmAEV/O1mupW7jYJrW0GQR7ntMmCth2XwFNNQ4s50vBICSt9SAmoJOZ60o3TvDjHDsoU+/cMl28/42+rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736088701; c=relaxed/simple;
	bh=AC4kRQZF6noDVVckYqn9QqQKhf9azMUkl6s7EdfNorI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bG3h9ocvcuCsvrG/bt2kFmW707Fm9XTNP+bbrkchbkprRk/b+PFLGXkEZ+1FVGTjgK88JXDhTYUU8u5zIThRzOzltyQqL8ic6WsV+DjUgFOMVmAWF3q+JWGMJIeBEUuKhQJ3rQ5JYi11B/qLFnMowfBuMoplEHYIwLsWHnafJmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ZhQMiNzG; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ZhQMiNzG"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43623f0c574so92831395e9.2
        for <regressions@lists.linux.dev>; Sun, 05 Jan 2025 06:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736088697; x=1736693497; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d4ftGznrfcVHgy3LbDB7TWfLC3X5H3QHzuaPq83JQYs=;
        b=ZhQMiNzGkjPwBOORe4BvDXd3ph+2n+LU/WpqAmku2VJWk3ZofCbWWE3nZ1ivQRk/DX
         m7Xw94Vskofr5h2zxMI+4LbS1TowU/btz0bV9Mr6CkJKYX7c1Ry0MXnTACUYsIRZme/X
         yDQhSXfZNBQAxDGe39ZSkGhezwEz4MFTxWo8yWM1I9E7dXgs1c3UkCXgGWCoc+Tz2QOc
         zGAe9+E1dvAoZecsqFqvIs+ei1uFdjBXzyWjUs9CLVJZsSSsIBO5XW4nBlCccBa385SK
         swY57/n60BvmfXF0yXTIjLX6u0Y/bbmsG/PZCzRL1S6fDeD0gRGwY7EbblP9bA/HAt/6
         Dr6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736088697; x=1736693497;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d4ftGznrfcVHgy3LbDB7TWfLC3X5H3QHzuaPq83JQYs=;
        b=VHK10bNzMXQeGUqVKqTQkkq9EYT6a3e1+LpmW8j95hBMYEu5oBd+/r32FEQJIP85j+
         AKtVh9cowP5VCPBCr8KnPUveiM2yuMxdINy03V6HWejRadZZldljlZQL8kR/RDkSZhcx
         5ECYqrQXtgUFAs0Jt3hco44keOW8usAqs14GXrTB2GLY6DKChIGWSohp55irg2+RAW+L
         AS12JPXTtFJMROfWO4qb7zcdbxRemZysL1CccN3Fy+irQMZAZZvG0bTzI+j5Cmts8cMn
         cp+9fva9ZLp14dXaeLj/dEOYUiR9InhfG/JS7a2rnh2ECgQCUT5rOr/vqU+dKx1McpnM
         Fo0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXgtDZfIYDDD0WzLua6hvIAY0WzHcRhPQtjqs+sIeGyRy6JPVtr1ne7vOZYDWuvSMV7znqt9w6znpWXCQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxd/TfOeWqZja1a570asCUGo+f16rSKmIfmpWmRr9Zj+hIfDYWl
	IYCN1KgYlwtCyVYvFZXGsqcclbWNQwi+kfs4gVk72tEHm8x8RFGw6Ki9I4fm/Us=
X-Gm-Gg: ASbGncvoRLwHuzB+fjvRuJdCVzUyMRvnL/4yEARNwssIZ8361UKlzoRtvLEnmSIdHAF
	wIS7ruvO+zwsq8uNQdldMb1zlAm8SH4mh55SDFfq9cU8vNSq5PHVzUSPxcQoGlcCdJ5opuxCueN
	nMwx4T4mwRTZ63qWgKHMxdAILvcwVi/6cphuiZ9P2ChqqfX7qHVfck+8I5EHbiLYiLFSLkxMPXH
	5I/OjT7HOth8nVMqC+D6W1FkMvZTh1gQKmBa6fOwkXx5Ni+tQeYqAWurhmG
X-Google-Smtp-Source: AGHT+IFJDzjsPSlXhzYJlpTbmixCAgq4k/85cMn1/VkUofjExNVvbvatnpaW9rHveVYnB2gLD17HEg==
X-Received: by 2002:a05:6000:1fae:b0:385:dea3:6059 with SMTP id ffacd0b85a97d-38a223fd3e5mr44897829f8f.49.1736088697468;
        Sun, 05 Jan 2025 06:51:37 -0800 (PST)
Received: from [10.100.51.161] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8acb85sm45334326f8f.103.2025.01.05.06.51.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jan 2025 06:51:37 -0800 (PST)
Message-ID: <c37395e2-1ab5-4175-9920-5144cf60e25e@suse.com>
Date: Sun, 5 Jan 2025 15:51:36 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ROX allocations broke livepatch for modules since 6.13-rc1
To: =?UTF-8?Q?Marek_Ma=C5=9Blanka?= <mmaslanka@google.com>
Cc: rppt@kernel.org, akpm@linux-foundation.org, mcgrof@kernel.org,
 regressions@lists.linux.dev, linux-modules@vger.kernel.org,
 linux-mm@kvack.org, live-patching@vger.kernel.org, joe.lawrence@redhat.com,
 jpoimboe@kernel.org, pmladek@suse.com
References: <CAGcaFA2hdThQV6mjD_1_U+GNHThv84+MQvMWLgEuX+LVbAyDxg@mail.gmail.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <CAGcaFA2hdThQV6mjD_1_U+GNHThv84+MQvMWLgEuX+LVbAyDxg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/30/24 01:09, Marek Maślanka wrote:
> Hi Mike and others,
> 
> I discovered that the patch "[v7,4/8] module: prepare to handle ROX allocations
> for text" has disrupted livepatch functionality. Specifically, this occurs when
> livepatch is prepared to patch a kernel module and when the livepatch module
> contains a "special" relocation section named
> ".klp.rela.<MODULE_NAME>.<SECTION_NAME>" to access local symbols.

Thank you for the report. It is possible for me to reproduce the issue
on my system. An annoying part is to create the
.klp.rela.<objname>.<secname> data, for which I eventually used one
floating variant of klp-convert [1]. To hit the problem, <objname> must
point to an object that is different from vmlinux. Such relocations are
processed by the livepatch code later than regular module relocations,
as you pointed out after mod->rw_copy is already reset.

I think the bug should be addressed in principle by Mike's recently
posted rework of the feature [2] but unfortunately, its current version
makes my system also unbootable [3].

My reproducer:

$ cat test_klp_livepatch.c
#include <linux/kernel.h>
#include <linux/livepatch.h>
#include <linux/module.h>
#include <linux/seq_file.h>
extern __attribute__((weak)) void *xfs_btree_new_root asm("\".klp.sym.rela.xfs.xfs.xfs_btree_new_root.0\"");
static int livepatch_cmdline_proc_show(struct seq_file *m, void *v) {
        seq_printf(m, "live patched: xfs_btree_new_root=%p\n", &xfs_btree_new_root); return 0; }
static struct klp_func funcs[] = { { .old_name = "cmdline_proc_show", .new_func = livepatch_cmdline_proc_show }, { } };
static struct klp_func xfs_funcs[] = { { } };
static struct klp_object objs[] = { { .funcs = funcs, }, { .name = "xfs", .funcs = xfs_funcs, }, { } };
static struct klp_patch patch = { .mod = THIS_MODULE, .objs = objs, };
static int test_klp_livepatch_init(void) { return klp_enable_patch(&patch); }
static void test_klp_livepatch_exit(void) { }
module_init(test_klp_livepatch_init);
module_exit(test_klp_livepatch_exit);
MODULE_LICENSE("GPL");
MODULE_INFO(livepatch, "Y");
MODULE_AUTHOR("Petr Pavlu <petr.pavlu@suse.com>");
MODULE_DESCRIPTION("Livepatch test: livepatch module");

$ make ...
$ klp-convert test_klp_livepatch.ko test_klp_livepatch.conv.ko  # [1]
# modprobe -a xfs ./test_klp_livepatch.conv.ko

[1] https://lore.kernel.org/live-patching/20240827123052.9002-3-lhruska@suse.cz/
[2] https://lore.kernel.org/linux-modules/20241227072825.1288491-1-rppt@kernel.org/
[3] https://lore.kernel.org/linux-modules/86eba318-464b-4b9b-a79e-64039b17be34@lucifer.local/

-- 
Thanks,
Petr
