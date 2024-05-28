Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2F3645
	for <regressions@lists.linux.dev>; Tue, 28 May 2024 04:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716871930; cv=none; b=qqXJWlt3tHAmbgqG976SKwoPf5kb+lL008NJ5wwOSD4797LyPFwxmobb1EUVfIEk1wzHBxSME7/KMyi3XLE06iVx+Q8quq2+jJ0QXsUvT1yFquskve3xKf+RoRs8hC/lX5pbMvI2N7pBG4McHiRS4VIIY3mvcnBU8xdgm7QzKj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716871930; c=relaxed/simple;
	bh=g7yMPL+lshsT2TyhdNE17+VKbTpRnVLb1qhQEeVrl8M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kAXuQOZ5jLcto+Q8HLSXuvPmgmbJfXJYXFxto+RJRQ3JpPg9ytSK4ogX26USrAPTSnPRVMCsk7fZK4ZShdj9X07aLOaDguJBcOpRPDfQj3KoS8qv2wtn/dxm+N29aG5WsCjnc4wMA9DCMgm0u0j85yLpMww7Rhm1I9gC3DI1dEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EXaQNRV9; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EXaQNRV9"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2e716e302bdso4521021fa.1
        for <regressions@lists.linux.dev>; Mon, 27 May 2024 21:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716871926; x=1717476726; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OtlJErHFMtX/7aNJSWoJWAzYMBeqsDWDnwMet809dVw=;
        b=EXaQNRV9AQJ82jpCT8T6Q+sLCXWCmggdONwLn9ZKXA9IIQXM/FjhABqaAjll9WHHVR
         keXJthEh3WlWxXwzD7G/lyiKIAjjPHV5SXkB+DXtsb7o9lImsRi6RI5JyQ1KmACEqkPL
         lUhC29inRvg9g57CUd2pq/97gkzRwHAyQLcaW70kyV0F5nJjq63xtG6awDCrZ3xEmjXy
         EzZ757EfbtRzVqxNnU3ibVjN2wnl4rzIlVyDiuYklyP/ZqXKTXjzrioTKwdGDVc6DF3U
         DusokIMcRGT3xotbV7DQSAffXcXoT2HoHqPM4tiZnnhR0bWD5FXF1koIoIhtcNjt+/7U
         Lh5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716871926; x=1717476726;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OtlJErHFMtX/7aNJSWoJWAzYMBeqsDWDnwMet809dVw=;
        b=L7TDvv6IOoA5QfRWP1gs25v0+3xMbll93adlK/jPg59a+quHRZsD3zsxG9hybt8Wam
         7/D8C009ATySP1/wQDsbLgF0riXd4y1S1voET8uWycDfX0BWCo0Uosg88Ef4qIQ6njrN
         5uRSaDaSQQss42n0wehbO30RHqXm/+voBNqWUAvMq5H3m2G5YepPSJc9u0NYHsPD0DMk
         PGB4ocERFuGrEKGerv76AsKlrC2hNZMCnsnedTfYSYIBiJ5UUPuN+KqHZYTLaI8CDB+e
         E7LbxcAoBMJQdQRwV2w0jucQBuV+FCuXtF2VcYcqg+JSmI7bWW0sDThPxCI8xUdJXdPy
         vTtA==
X-Forwarded-Encrypted: i=1; AJvYcCVUHva0nhmn2gf2WmdGV5uvjeIuH7+yByaRRsxjBeWBA0TY2NTe5BZHPBjcOXveCLq39xrxQuDf7lG5UDmDx6rQQJOWhVx7IDX29cw=
X-Gm-Message-State: AOJu0YxX9ca6N+N/CwxLIRxFHZDqwXcNEzFQvfoQ2jTmOcMd15GVRJVg
	hjnTcZAeuKUYVBTOy5dCh4O3ioRT3eXUScQHN3vKa0StojMBpoURYw7EvdLAkjKVWf+brWcHFvV
	OiLKDhIjdc3R+CR4RG8hGwAWYW/iDHC2t
X-Google-Smtp-Source: AGHT+IGkmdptDYW6j8rM+09xEDEuBMSvKo6CuZyQBAj/62lzzpgALrY5Khj8WVJm0wW7WJcoP8TrcByyuXfvEsxSCc4=
X-Received: by 2002:a2e:a78d:0:b0:2e9:87bb:1ce8 with SMTP id
 38308e7fff4ca-2e987bb1d9amr3617351fa.35.1716871926371; Mon, 27 May 2024
 21:52:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAE4VaREzY+a2PvQJYJbfh8DwB4OP7kucZG-e28H22xyWob1w_A@mail.gmail.com>
 <5b79732b-087c-411f-a477-9b837566673e@leemhuis.info> <20240527183139.42b6123c@rorschach.local.home>
In-Reply-To: <20240527183139.42b6123c@rorschach.local.home>
From: =?UTF-8?B?SWxra2EgTmF1bGFww6TDpA==?= <digirigawa@gmail.com>
Date: Tue, 28 May 2024 07:51:30 +0300
Message-ID: <CAE4VaRHaijpV1CC9Jo_Lg4tNQb_+=LTHwygOp5Bm2z5ErVzeow@mail.gmail.com>
Subject: Re: Bug in Kernel 6.8.x, 6.9.x Causing Trace/Panic During Shutdown/Reboot
To: Steven Rostedt <rostedt@goodmis.org>
Cc: "Linux regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, stable@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

yeah, the cache_from_obj tracing bug (without panic) has been
displayed quite some time now - maybe even since 6.7.x or so. I could
try checking a few versions back for this and try bisecting it if I
can find when this started.

--Ilkka

On Tue, May 28, 2024 at 1:31=E2=80=AFAM Steven Rostedt <rostedt@goodmis.org=
> wrote:
>
> On Fri, 24 May 2024 12:50:08 +0200
> "Linux regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.inf=
o> wrote:
>
> > > - Affected Versions: Before kernel version 6.8.10, the bug caused a
> > > quick display of a kernel trace dump before the shutdown/reboot
> > > completed. Starting from version 6.8.10 and continuing into version
> > > 6.9.0 and 6.9.1, this issue has escalated to a kernel panic,
> > > preventing the shutdown or reboot from completing and leaving the
> > > machine stuck.
>
> You state "Before kernel version 6.8.10, the bug caused ...". Does that
> mean that a bug was happening before v6.8.10? But did not cause a panic?
>
> I just noticed your second screen shot from your report, and it has:
>
>  "cache_from_obj: Wrong slab cache, tracefs_inode_cache but object is fro=
m inode_cache"
>
> So somehow an tracefs_inode was allocated from the inode_cache and is
> now being freed by the tracefs_inode logic? Did this happen before
> 6.8.10? If so, this code could just be triggering an issue from an
> unrelated bug.
>
> Thanks,
>
> -- Steve
