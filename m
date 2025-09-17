Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E092877D8
	for <regressions@lists.linux.dev>; Wed, 17 Sep 2025 07:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758094962; cv=none; b=VX+bxC4HTWEMpTYBlG8eclOJGXenACP8jbl/Vl0bdokbn/AVA/T/45oRCzfppKqjfFcE0SORodmhnxrkNV3cLNnA934CtTTDWFoUDR0/C2EWqc4V+NKkFGu0p5ThZ6iJqLp5pEBkhP2xP5/IRcdXblwjUsEUpWpBdsVnzWojaFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758094962; c=relaxed/simple;
	bh=9GwEnzSffbw5H8CgU8KOdFD0FcDNiTS5Mae2BARQKLk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VjUWP4BQuVVJYpPkeUQkGtEe5+uv9Sl9Q5kNGu6dNOZk5fBIlUFDSVxXwDsZSfeJO9uHmV4P+2LfrsaNi/QOTLYOAfwb8zdTbb2DE23d0/QVoFCZqAkOyLGJJyeK4JADFIrIK7dQLCMyAKXoLpIFL4xuU0JKygKGY6Vpjts8NME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P1jecGZ0; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P1jecGZ0"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3ece1102998so103100f8f.2
        for <regressions@lists.linux.dev>; Wed, 17 Sep 2025 00:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758094959; x=1758699759; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oMzCzcs4sKSWk/z9LxqQB9n4/0J+86L6TlxBIp5RzGs=;
        b=P1jecGZ02WnwAv3qL6WkuHHPx7TYgGtT9qz+a5YXsguwDzBmJsKD307/e8tw/nFa9B
         w7QJTHRsr/YLCirI9b9q/XKYKYTZ1yNBpTOPWZrOh5wrSv1T9FZTzfNIZDDjgE9SBTPf
         DAsTXt7q68GpBvy6GN6Ftf03LZ8dUA8BptBibJ9Sk1OlBAfhY0v0fH35hasouR8Pyil2
         rWscykN+ruNEtDUlqLbc2RL52xm9xn5Vz+HZEqSTtHWDKLYfq4QFzb8FqoDSoeWzTZXM
         TGfLyD4epsK+a3oEqnnQrlIno7A75QsRPn6YOC31r/Dul010RrmL6tuyopFY72JJDDeV
         Rm7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758094959; x=1758699759;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oMzCzcs4sKSWk/z9LxqQB9n4/0J+86L6TlxBIp5RzGs=;
        b=FDhJ+6GVLZnmHnBVlHJOXIU2A93E1NQbBT6xW9pM63hYd9UGjtERaU5Wv8+rUCZS9I
         uvDA4AdnpXW80ZbUgyULORM/BwGQifhTKCautzQhOKgRkLYzQcsNWzLCM8Pyi23p5ugv
         fm6/HnCFSzY6IkoQs4L5KAp/U2EkQJneROFDKwV07qWsIn/soeYrbvyWVXPXAgonTtdc
         SU518DOLjmbb8123CjemNbJx9TsLRZaDWirZ4bLwNeaT/4tmeg1lLUgNNWbF4AiHvuf2
         KNFF6m3ls57js7fVWXqUMumOm/stEtJc5UyaPZRiJwzLIZOzgQxt/CJ7bxrT5LbVA+vt
         ARXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWoV1vv1QKZIEAJv7VBnl7ZHoB/g/qZj0egeATmK6X/WvUD5SpQbHNZsbMLa+Gu1NPxRuvManoEwY7gzA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz82SmW/uc3oiwBQGfxhf0+LY3Jr+OExm7AxCNCJlltMUzjxPqs
	1WtDOeOpHT3Au62rLRv9P+uyicc5umUC8TiMknUi2MufmYDugGbHvk6tIiWSs7VXfEM=
X-Gm-Gg: ASbGncvLM3M0L8wPxjHcGbRphG4xwrPUhx/s4ENfLQ6I4kNRMWxuHrz/r/2L9vQT5pw
	ekn8a6o6MbDmELhL7cJ35HcW3BB7aia2RoeY0BdWCm5dOpb71L0oviC6jc1V06sbvEF5EKod+Mr
	m5tcQ3jMkn0/ylXa60pVK5wljLodmXT2tj4olNBmgSpG4qXXhAlEfLagXvmh5EkHH2RcFQws2Eo
	Qk2K21lPhfzFFJGLMVpdUS6v9ARMAGXpkUN9YRzY6ggUKLt3HVQ7UQNSkTRoda02qP+Lp9Y49eo
	TK5hbdsSfRDgDehfhetn5Y+wZKfqLNu5CWV6YmpKsGyuRDmXd1KUgVsLxGxern4VcbLZfMMIooY
	kXS82PvrHner70uon7klTHbY+5zo=
X-Google-Smtp-Source: AGHT+IFnhuMCQzSPR3g4mNraRS235VJdldWT6BwGNxpmI42pebjJriNR/dcn2WvXRaSO9d0EpAF1Nw==
X-Received: by 2002:a05:6000:178e:b0:3e0:2a95:dc9e with SMTP id ffacd0b85a97d-3ecdfa3b817mr1007435f8f.57.1758094959152;
        Wed, 17 Sep 2025 00:42:39 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3eaa6476fadsm11990670f8f.45.2025.09.17.00.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 00:42:38 -0700 (PDT)
Date: Wed, 17 Sep 2025 10:42:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christian Heusel <christian@heusel.eu>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>,
	rust-for-linux@vger.kernel.org,
	open list <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	lkft-triage@lists.linaro.org, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Alice Ryhl <aliceryhl@google.com>, Benno Lossin <lossin@kernel.org>,
	Elle Rhumsaa <elle@weathered-steel.dev>,
	Arnd Bergmann <arnd@arndb.de>,
	Anders Roxell <anders.roxell@linaro.org>,
	Ben Copeland <benjamin.copeland@linaro.org>
Subject: Re: next-20250915: error[E0425]: cannot find function
 `atomic_read_acquire` in crate `bindings`
Message-ID: <aMpma-2UokTo0u9j@stanley.mountain>
References: <CA+G9fYtT7HNBM2XBbePeZ-Fw+ig7SJ+JE_NpQ1VuHR_TvAjX2w@mail.gmail.com>
 <CA+G9fYs4JB0ngq+aryXHVQSq-f05cb4agCfyM9zN0SgprQf0_A@mail.gmail.com>
 <27366f94-67d4-4b73-b420-cacdbe9d603f@heusel.eu>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <27366f94-67d4-4b73-b420-cacdbe9d603f@heusel.eu>

On Tue, Sep 16, 2025 at 06:46:06PM +0200, Christian Heusel wrote:
> On 25/09/16 09:56PM, Naresh Kamboju wrote:
> > On Tue, 16 Sept 2025 at 11:17, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> > >
> > > The following build warnings / errors noticed on the arm arm64 and x86_64
> > > with rust config build on the Linux next-20250915 tag.
> > >
> > > First seen on next-20250915
> > > Good: next-20250912
> > > Bad: next-20250915
> > >
> > > Regression Analysis:
> > > - New regression? yes
> > > - Reproducibility? yes
> > >
> > > * arm, build
> > >   - rustclang-lkftconfig-kselftest
> > >   - rustgcc-lkftconfig-kselftest
> > >
> > > * arm64, build
> > >   - rustclang-lkftconfig-kselftest
> > >   - rustgcc-lkftconfig-kselftest
> > >
> > > * x86_64, build
> > >   - rustgcc-lkftconfig-kselftest
> > >   - rustclang-nightly-lkftconfig-kselftest
> > >
> > > Build regression: next-20250915: error[E0425]: cannot find function
> > > `atomic_read_acquire` in crate `bindings`
> > 
> > Anders bisected this build regressions and found,
> > 
> > # first bad commit:
> >  [eb57133305f61b612252382d0c1478bba7f57b67]
> >  rust: sync: Add basic atomic operation mapping framework
> 
> Is this still an issue on next-20250916? As far as I can tell this has
> been fixed, but now there is another rust build issue, see
> https://lore.kernel.org/regressions/0fee48bb-7411-4414-b4e7-395a8c3d0f6c@heusel.eu/
> for more information.
> 
> Cheers,
> Chris
> 

next-20250916 still fails but with a different Rust issue.

$ make
  SYNC    include/config/auto.conf
  HOSTCC  scripts/basic/fixdep
  CALL    scripts/checksyscalls.sh
  DESCEND objtool
  INSTALL libsubcmd_headers
  RUSTC L rust/kernel.o
error: expected one of `,` or `}`, found `;`
  --> rust/kernel/block/mq/gen_disk.rs:12:23
   |
12 |     fmt::{self, Write};
   |                       ^
   |                       |
   |                       expected one of `,` or `}`
   |                       help: missing `,`

error: aborting due to 1 previous error

make[2]: *** [rust/Makefile:553: rust/kernel.o] Error 1
make[1]: *** [/home/dcarpenter/progs/kernel/devel/Makefile:1286: prepare] Error 2
make: *** [Makefile:248: __sub-make] Error 2

regards,
dan carpenter

