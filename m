Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C2F747A
	for <regressions@lists.linux.dev>; Thu, 16 Feb 2023 15:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676561636;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qeQYQxyJSAMsBVRXT+gaV/xgFEd8Rxkvo3bIKZXtNYs=;
	b=HWDUnxYt1IA3+Vazqvmg5aSpBp/G2/vviB64Kvk4XeAJbEKKMTJtUwKm/QiuEXaIj820Q/
	BQcAfI5WALEGqQIP0BQs/DkcuOaw7TnqW99OxB7Z3pcCLyMgRThpAvV7FZS0FhQK1eOiBe
	9juowFnpg0tDhiBx582S7jJsU04FgTg=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-648-4-weKbIAP92wSPh2AZeBEg-1; Thu, 16 Feb 2023 10:33:55 -0500
X-MC-Unique: 4-weKbIAP92wSPh2AZeBEg-1
Received: by mail-il1-f200.google.com with SMTP id g1-20020a92cda1000000b0030c45d93884so1493073ild.16
        for <regressions@lists.linux.dev>; Thu, 16 Feb 2023 07:33:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qeQYQxyJSAMsBVRXT+gaV/xgFEd8Rxkvo3bIKZXtNYs=;
        b=mFdq5j68I/XoUcx5DL5/o5u6YtSRuAGBbbsaNiEsjeT0nPMRxIuvEqscFO3ladMihz
         l9yMX3sWEQVkOIwyEsT4bjb1pNEUjKssHLwZ7NZM7pe1YhPYWUGIjr3fEEODUrDGPt42
         P0xdZe80PbZiZ0zH6lrPwPd4N787Zu56idmmkl2Vt9taNmusktqZJodX5JBSzDGdUzsq
         9v55fxS7x2SCv1Z1m1btOZeYkpE3JE18D7VwboK1fyql9PGmU88R39zKgfTpVf9oqpIY
         3K5HUzDTzOO8N/MJaSrimWAd2OvnHD7AEp8ef6/O+FxH4DgKigDPJQzw69omQIzlgoh8
         VDAw==
X-Gm-Message-State: AO0yUKUe3K6ZOaRq/M7+DGBI2TgnqlY0vYS8H+fZq0YDAA4Cc1lgmRgg
	7Ypwy5f2AE998yvEorBls1PkcUtxTcG264EelT540+coBH4B3olLUQBf+9t1vnZqGRhVGRklR4k
	Rv5cg5RFXd93MhMGkcLi7U/E=
X-Received: by 2002:a05:6602:5cd:b0:73a:6c75:5a85 with SMTP id w13-20020a05660205cd00b0073a6c755a85mr3727047iox.0.1676561632907;
        Thu, 16 Feb 2023 07:33:52 -0800 (PST)
X-Google-Smtp-Source: AK7set+h4rAfOjfEETcRvGoeKLhBvNlkJkZqTyazjzNPwMYB/1qXXAYupXsUtXuE7aklEhW9g2jibA==
X-Received: by 2002:a05:6602:5cd:b0:73a:6c75:5a85 with SMTP id w13-20020a05660205cd00b0073a6c755a85mr3727038iox.0.1676561632677;
        Thu, 16 Feb 2023 07:33:52 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca. [70.30.145.63])
        by smtp.gmail.com with ESMTPSA id w5-20020a6bd605000000b007407ea5d07csm559095ioa.51.2023.02.16.07.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 07:33:52 -0800 (PST)
Date: Thu, 16 Feb 2023 10:33:50 -0500
From: Peter Xu <peterx@redhat.com>
To: Nick Bowler <nbowler@draconx.ca>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
	linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: PROBLEM: sparc64 random crashes starting w/ Linux 6.1
 (regression)
Message-ID: <Y+5M3qezT2t0wPx+@x1n>
References: <CADyTPExpEqaJiMGoV+Z6xVgL50ZoMJg49B10LcZ=8eg19u34BA@mail.gmail.com>
 <Y9bvwz4FIOQ+D8c4@x1n>
 <CADyTPEzsvdRC15+Z5T3oryofwRYqHmHzwqRmJKJoHB3d7Tdayw@mail.gmail.com>
 <91b38494-f296-d01d-3b98-6bc51406cad0@leemhuis.info>
 <Y+z4XlhDzokAMTI1@x1n>
 <CADyTPEzcJxgFgQAwopsHz3b-e+hmHJqidpjzDhow8KkkAyyo8g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CADyTPEzcJxgFgQAwopsHz3b-e+hmHJqidpjzDhow8KkkAyyo8g@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Feb 16, 2023 at 12:32:54AM -0500, Nick Bowler wrote:
> On 2023-02-15, Peter Xu <peterx@redhat.com> wrote:
> > On Wed, Feb 15, 2023 at 03:49:56PM +0100, Linux regression tracking
> > (Thorsten Leemhuis) wrote:
> >> On 31.01.23 02:46, Nick Bowler wrote:
> >> > I'll keep running this for a while to see if any other problems come
> >> > up.
> >>
> >> Nick, I assume no other problems showed up?
> >>
> >> In that case Peter could send the patch in for merging. Or did you do
> >> that already?
> >
> > Thanks for raising this again.  Nop, I'm just waiting for a final ack from
> > Nick to make sure that nothing went wrong after the longer run.
> 
> Oh, yes, it wasn't so much a "run" as just continuing to use the
> computer normally.
> 
> Everything seems stable enough.

Thanks Nick.

I've just posted a formal patch with you copied.  There's a slight tweak
due to rebasing to the latest akpm tree, but I still attached your
tested-by for appreciations on the help, and I assume it should have the
same functional change.

-- 
Peter Xu

