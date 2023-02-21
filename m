Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4BEB79C1
	for <regressions@lists.linux.dev>; Tue, 21 Feb 2023 18:04:57 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id y2so1673513pjg.3
        for <regressions@lists.linux.dev>; Tue, 21 Feb 2023 10:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mCAjmH+y9RfcSzdsqktWB2qihaToifWXvEEckSYFn1U=;
        b=cU+qS1cAwy/+6/YsKudl6aFY83WeYfdNkUxRNjXboI53GB2RXfA7NKjWuZmgDz/d1C
         buCc5HCXS4h4PTgFk2RuCicEaCcw7TpdEUAJlIJGR28Xn3xb8YwZys+ge8j3sGGtCWia
         WXtYVfAP31VrjczgWUpI4/RmcX3GdDwJEurlXz1GycoBMnbNEw/RIUtq8NWI9/wXA0FF
         blZexmwat0G0MfAdAljh5/hHVMAP9vSb3/kEIxAmbX9/QC6WBkKDGj76yMaAzkQgQjDc
         HnG0mYMtVCLi9h2zAZiJki93BNA8/17mG2xQ9STIsAPVMzwfTHJyai1ySZ1spHa2Vjhj
         uFEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mCAjmH+y9RfcSzdsqktWB2qihaToifWXvEEckSYFn1U=;
        b=BILCGF0KsQWRuSTZ5V9HtVE5dtG/cgxCGTf09hyyoeAHN8VF2fkIL0Z6zh05myQHat
         jWMUlBb+04JDxzs65j/7hn+zVQvJfoZBPOvbMziRkUhkgphJE/TqRIHxcevSg0HlFTC0
         o+RQYypzYU8fmU2P7CL6Y5m3qTq9AMv4F192infeLmV9+NWQJjKNpxrYH1vj7Oy4YsDt
         bPLzuLrA13BE9AgHmPk7HJHNyRVv+Eo6mjigA9vJ3VWy9sF6lW2LSzd6XqALn8jU1ib3
         YGzQL050P3wp0GQXGkjeCjff8tVEIHROF9o6tZmozs5S82S+TRlpeeLxxCVhQLFwkjzu
         ShOQ==
X-Gm-Message-State: AO0yUKXaimofS23LTb8WemWARUY4htx4U6nFhCGZTxjkRL4uoqGQIK9P
	R8GOgNJgOP1AEj4It6bIWlL3Wo4hlY/OxOoiuMdMQaV2btAT0w==
X-Google-Smtp-Source: AK7set+DPvt4gc1+MMSfea4jAKfm3GuiLqy6YIIuhZXw3q9nS6EVev/33IgWsrSeIZ4R0sI9pU5NSkPSQXtwRvPcVUs=
X-Received: by 2002:a17:902:f783:b0:198:f13d:571b with SMTP id
 q3-20020a170902f78300b00198f13d571bmr730679pln.1.1677002697193; Tue, 21 Feb
 2023 10:04:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <52f9afe2-f621-77d8-9d10-449d539e901d@leemhuis.info>
 <Y+5JdR02tlzD/TFS@kbusch-mbp> <151a00d9-0ea2-eadb-72b4-fa8a2dd41bfc@kernel.dk>
 <CACosJgyjgh+cz6nTrKWVQ9P8Z9_wJGWGQBOjae2MoJrZQ3RmTQ@mail.gmail.com> <Y/T5L1ZIssWY5wQZ@kbusch-mbp>
In-Reply-To: <Y/T5L1ZIssWY5wQZ@kbusch-mbp>
From: Michal Berger <michallinuxstuff@gmail.com>
Date: Tue, 21 Feb 2023 19:04:46 +0100
Message-ID: <CACosJgxLbU95SuPo+oPCT-0EyG4p_CpgLAh+WafQxCN0Yn0Lhw@mail.gmail.com>
Subject: Re: [regression] Bug 217037 - cmb attributes missing from the nvme
 class under sysfs
To: Keith Busch <kbusch@kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, Jens Axboe <axboe@fb.com>, 
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Oh, that's quite alright -  I asked just to make sure I didn't miss
anything. :) With that said, I just spun up the build (based on
89f5349e) with your commit inside and I can confirm the issue is fixed
on my end (all the attributes are back where they should be).
Appreciate the help!

Regards,
Michal


wt., 21 lut 2023 o 18:02 Keith Busch <kbusch@kernel.org> napisa=C5=82(a):
>
> On Sun, Feb 19, 2023 at 11:54:37PM +0100, Michal Berger wrote:
> > Have there been any patches submitted for testing? I don't see any as
> > part of this thread nor at the bugzilla where the issue was initially
> > reported. :)
>
> I'm sorry, I didn't see your email in the bugzilla. With time running out=
, I
> just posted the patch for upstream with a link to your original report, b=
ut I
> apologize for not getting you CC'ed on it. The fix is included in the 6.2
> release.
