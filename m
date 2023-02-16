Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5D717E3
	for <regressions@lists.linux.dev>; Thu, 16 Feb 2023 05:32:56 +0000 (UTC)
Received: by mail-vk1-f180.google.com with SMTP id f17so675381vkm.2
        for <regressions@lists.linux.dev>; Wed, 15 Feb 2023 21:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=draconx-ca.20210112.gappssmtp.com; s=20210112; t=1676525575;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HsyCa4qZ8zblrP/1Ar6ck7otvAlYM3tSElZO/ohODIw=;
        b=g0EYq17FgxoqVL/d7fMXR4B6DGC6hhBHpL1ZZImljOc2NBjdOjtF8scC80uHUxYsTb
         7JceBBk7mVYMbucjsbGpW2JxQm3EkkPLDGWoamxFQPGfB7RMkW0Yo3N7OEiV/OmoqjHb
         TeUXxCtYZDKZiQlR6GW+oa1kHpwaBr8tsTRv6GzJcC82XQ5Rj5VoiptGOyplYaz/OMnP
         MCN1QzrOE0b/E46yqKwHDzOxfxBWIxBFvgWQeaOFQyVC3I3vJ66858RAqo67VmiVqsPh
         hzwt6BrSKSIflhQGLunbJVoSeyF02glS8s1+kGVWSKxCObxIEPvLYGWAdbM91fLIIikP
         3Mww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1676525575;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HsyCa4qZ8zblrP/1Ar6ck7otvAlYM3tSElZO/ohODIw=;
        b=Wv+8jamYDmkyvG59jbDWfbwSozW+gu97gTmLg9pcXg3h7MWeL46CVaW3I5lmI2zkaI
         v/g9Y9Cz2bqUWkVgkFNNIEBpKVltSBOXHQoxhqfeQmh+/r7AFswRAVLUv1sIump0XSyz
         k4GDIfiuzk419tm1F0LVYnEg0YIlfz7coQBFC2b+TpfKYPsjHhdkkrNwG9ZKRilCFSvG
         3YhD/ceaW2fwyzmjTi1jEnN5oJfxtuHg6V1fK1yucixpAFTiS9pR7ZZTik4I5MboKZ5r
         h1A78iI1rJ7oD/2Hbcep9Te3YyW6V22U/eWQbmP64JUZM5Qa70sGWiKktJLlsygbbFnu
         9pWg==
X-Gm-Message-State: AO0yUKVeojZc/zR3h+YuC6uhCLcFkdDivCTdbsKSaBkQ+jNgsalRCiz1
	cM2PUDiHIDdIW9fzCRb0yU+zmMcmeAjH4umehstTjg==
X-Google-Smtp-Source: AK7set91SDBSprweROGSxFxvLHWRk6jWUA2ecvsXeu63BHrYuvcpU7xhxeS85kaGX682U26mJFQir1lcf8IBn9uPEcI=
X-Received: by 2002:a05:6122:1462:b0:401:a48d:3d with SMTP id
 r2-20020a056122146200b00401a48d003dmr718120vkp.14.1676525575513; Wed, 15 Feb
 2023 21:32:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Received: by 2002:a05:6130:1015:b0:559:9619:d862 with HTTP; Wed, 15 Feb 2023
 21:32:54 -0800 (PST)
X-Originating-IP: [24.53.241.2]
In-Reply-To: <Y+z4XlhDzokAMTI1@x1n>
References: <CADyTPExpEqaJiMGoV+Z6xVgL50ZoMJg49B10LcZ=8eg19u34BA@mail.gmail.com>
 <Y9bvwz4FIOQ+D8c4@x1n> <CADyTPEzsvdRC15+Z5T3oryofwRYqHmHzwqRmJKJoHB3d7Tdayw@mail.gmail.com>
 <91b38494-f296-d01d-3b98-6bc51406cad0@leemhuis.info> <Y+z4XlhDzokAMTI1@x1n>
From: Nick Bowler <nbowler@draconx.ca>
Date: Thu, 16 Feb 2023 00:32:54 -0500
Message-ID: <CADyTPEzcJxgFgQAwopsHz3b-e+hmHJqidpjzDhow8KkkAyyo8g@mail.gmail.com>
Subject: Re: PROBLEM: sparc64 random crashes starting w/ Linux 6.1 (regression)
To: Peter Xu <peterx@redhat.com>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>, linux-kernel@vger.kernel.org, 
	sparclinux@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"

On 2023-02-15, Peter Xu <peterx@redhat.com> wrote:
> On Wed, Feb 15, 2023 at 03:49:56PM +0100, Linux regression tracking
> (Thorsten Leemhuis) wrote:
>> On 31.01.23 02:46, Nick Bowler wrote:
>> > I'll keep running this for a while to see if any other problems come
>> > up.
>>
>> Nick, I assume no other problems showed up?
>>
>> In that case Peter could send the patch in for merging. Or did you do
>> that already?
>
> Thanks for raising this again.  Nop, I'm just waiting for a final ack from
> Nick to make sure that nothing went wrong after the longer run.

Oh, yes, it wasn't so much a "run" as just continuing to use the
computer normally.

Everything seems stable enough.

Cheers,
  Nick
