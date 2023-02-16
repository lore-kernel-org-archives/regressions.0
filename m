Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED486FD6
	for <regressions@lists.linux.dev>; Thu, 16 Feb 2023 17:40:28 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id d8so2775571plr.10
        for <regressions@lists.linux.dev>; Thu, 16 Feb 2023 09:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=V+KTxKIHjRmWBf0QETpjuOdM8DYig3OAwkvnEuzaxSU=;
        b=K09IVJNC7CR6Vj9s+Sa4FSd5pt3rF8aeDkMbwTg0mXZfk8aJ8m+ZEFc/4sH8acTAcF
         JrsEgtMgVVTwR9xiuoDm2UndcobmlgfCa0UkuviWbd7NsLFCKMkU7rLl3hWzJB2cfhcA
         AnsM3VaqEybR+ccR9p3UjHOUNmaRYBqIr0RYtDIRK+/FpBFWl02Sp+azJVv9Hql0PXS8
         3n1IKSLP/+V/AL+rKUgUK/NU5cDjhjGqAdpvebYjh7BLgzQkwMQ/Z2by7pzYuA3Wn5B4
         YBvZZ8q4QDdtD41fF123Bc0ItfG0a3Lz6Vvld1BIGUveu3jN/frShp/F6+j/c/weTi5W
         w4cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V+KTxKIHjRmWBf0QETpjuOdM8DYig3OAwkvnEuzaxSU=;
        b=kbP7Vd2UD2ovbiexZ7DWSTghR6CIAquGlZ5jhYGZ594LD7anOAjYgkR4XajLvJUrUc
         veh/7cV930ZgcXLeLPw+yV9OxIlkgkAC7iNb1BaO4Y+ODBI3LZKNvth40OH80oM9Nf3L
         6l45qctq2Y0fpU6N6rLheVoLGK7N9rbR+eqtB0QvJhqxy/oNmI6m8F9zz2EQ12Po1z8s
         b6HrMFBvlLBTeGE6Yw1iviG2H/o2olxcx21q2NN71j48LKc+ogQEraoOG5ynwrkNpZh8
         d5jXTwqTsRizPQ8anHYU03l9wVrkUCRo+mBCcY311bXJ/2yyrC/OC+/q6ZPResKEDZZa
         LF4Q==
X-Gm-Message-State: AO0yUKUQ3BR8oybcdnyQOC7uVNGMeeT6A3Cskh0qZhjjSouatdM1GHxn
	LBhpl2n3ga+s9acnyCs0gM3gC72Kp80jLjcLM3swTPD+0Ik=
X-Google-Smtp-Source: AK7set/vWx1/1G+jCPRA4Yilt8YKORdc3vNIfM+JZrKCrXM/T3QMA7eVNW1h0Ylwq1MI1m/Ngdkg1zKNCq8ayGJdDTA=
X-Received: by 2002:a17:90b:390b:b0:233:e236:d54e with SMTP id
 ob11-20020a17090b390b00b00233e236d54emr751381pjb.123.1676569227665; Thu, 16
 Feb 2023 09:40:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <f591b13c-4600-e2a4-8efa-aac6ad828dd1@linaro.org>
 <82526863-d07a-0a5d-2990-1555b1387f26@linaro.org> <2C5E9725-F152-4D2E-882E-CF92A35481BF@hammerspace.com>
 <7ba38377-7992-7f0f-d905-cceb42510f39@linaro.org> <51430925-8046-7066-84ed-2ff0db835347@linaro.org>
 <CAFX2Jf=5X3zyZEWQmD6Rg9jQAD7ccDbae5LQCwrAyPCVVoFumg@mail.gmail.com>
 <2add1769-1458-b185-bc78-6d573f61b6fc@linaro.org> <CAFX2JfnKy7juGQaDTzqosN9SF-zd+XrhSL9uh_Xg0GpJGDux-A@mail.gmail.com>
 <32530c36-91d0-d351-0689-aed6a0975a4b@linaro.org> <2f285607-cbf9-6abc-f436-edb6e9a3938b@linaro.org>
 <CAFX2Jfmz7QqZBEdzbPUhPs0yctnXVaVF68tX1c57YX=6ki=0TA@mail.gmail.com>
 <4fe39d77-eb7c-a578-aefa-45b76e2247c2@linaro.org> <CAFX2JfmdRMsHPTySiw4vm7BwJfRZj3s0V3_v7NJ+XwMxBBSo9A@mail.gmail.com>
 <a3683dd3-3f30-bb4c-539d-d1519de6e5bf@linaro.org>
In-Reply-To: <a3683dd3-3f30-bb4c-539d-d1519de6e5bf@linaro.org>
From: Olga Kornievskaia <aglo@umich.edu>
Date: Thu, 16 Feb 2023 12:40:16 -0500
Message-ID: <CAN-5tyEPP-mcDv7f-=BTZdGWMuFh16R9QnsU6THdp3U0QgbeVA@mail.gmail.com>
Subject: Re: Regression: NULL pointer dereference after NFS_V4_2_READ_PLUS
 (commit 7fd461c47)
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Anna Schumaker <schumaker.anna@gmail.com>, Trond Myklebust <trondmy@hammerspace.com>, 
	Anna Schumaker <Anna.Schumaker@netapp.com>, linux-nfs <linux-nfs@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 14, 2023 at 6:08 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 12/02/2023 15:05, Anna Schumaker wrote:
> >>> From ac2d6c501dbcdb306480edaee625b5496f1fb4f5 Mon Sep 17 00:00:00 2001
> >>> From: Anna Schumaker <Anna.Schumaker@Netapp.com>
> >>> Date: Fri, 10 Feb 2023 15:50:22 -0500
> >>> Subject: [PATCH] NFSv4.2: Rework scratch handling for READ_PLUS
> >>>
> >>
> >> Patch is corrupted - maybe mail program reformatted it when sending:
> >>
> >> Applying: NFSv4.2: Rework scratch handling for READ_PLUS
> >> error: corrupt patch at line 12
> >> Patch failed at 0001 NFSv4.2: Rework scratch handling for READ_PLUS
> >
> > That's weird. I wasn't expecting gmail to reformat the patch but I
> > guess it did. I've added it as an attachment so that shouldn't happen
> > again.
>
> Still null ptr (built on 420b2d4 with your patch):
>
> [  144.690844] mmiocpy from xdr_inline_decode (net/sunrpc/xdr.c:1419 net/sunrpc/xdr.c:1454)
> [  144.695950] xdr_inline_decode from nfs4_xdr_dec_read_plus (fs/nfs/nfs42xdr.c:1063 fs/nfs/nfs42xdr.c:1147 fs/nfs/nfs42xdr.c:1360 fs/nfs/nfs42xdr.c:1341)
> [  144.702452] nfs4_xdr_dec_read_plus from call_decode (net/sunrpc/clnt.c:2595)
> [  144.708429] call_decode from __rpc_execute (include/asm-generic/bitops/generic-non-atomic.h:128 net/sunrpc/sched.c:954)
> [  144.713538] __rpc_execute from rpc_async_schedule (include/linux/sched/mm.h:336 net/sunrpc/sched.c:1035)
> [  144.719170] rpc_async_schedule from process_one_work (include/linux/jump_label.h:260 include/linux/jump_label.h:270 include/trace/events/workqueue.h:108 kernel/workqueue.c:2294)
> [  144.725238] process_one_work from worker_thread (include/linux/list.h:292 kernel/workqueue.c:2437)
> [  144.730782] worker_thread from kthread (kernel/kthread.c:378)
> [  144.735547] kthread from ret_from_fork (arch/arm/kernel/entry-common.S:149)

My 2cents...

From what I can tell read_plus only calls xdr_inline_decode() for
"numbers" (eof, #segs, type, offset, length) and we always expect that
__xdr_inline_decode() would return a a non-null "p". But if
__xdr_inline_decode() returned null, the code would call
xdr_copy_to_scratch() which would ultimately call the memcpy().
xdr_copy_to_scrach() expects the scratch buffer to be setup. However,
as I said, for the decode of numbers we don't set up the scratch
space. Which then leads to this oops. How, the reason the
__xdr_inline_decode() would return a null pointer if it ran out it's
provided xdr space which was provided #decode_read_plus_maxsz.

#define NFS42_READ_PLUS_DATA_SEGMENT_SIZE \
                                        (1 /* data_content4 */ + \
                                         2 /* data_info4.di_offset */ + \
                                         1 /* data_info4.di_length */)
#define decode_read_plus_maxsz          (op_decode_hdr_maxsz + \
                                         1 /* rpr_eof */ + \
                                         1 /* rpr_contents count */ + \
                                         NFS42_READ_PLUS_DATA_SEGMENT_SIZE)

while a data segment needs (2) + (1), a hole segment needs to be (2) +
(2) (as both offset and lengths are longs.

while a "correct" maxsz is important for page alignment for reads, it
might means we are not providing enough space for when there are hole
segments? It seems weird that for the spec we have hole length and
data length of different types (long and int).

>
>
>
> Best regards,
> Krzysztof
>
