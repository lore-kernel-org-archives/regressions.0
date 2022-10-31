Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C454D181
	for <regressions@lists.linux.dev>; Mon, 31 Oct 2022 08:30:10 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id x21so14450498ljg.10
        for <regressions@lists.linux.dev>; Mon, 31 Oct 2022 01:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Jn48igS3IBXvOF+EgMV6gXOl/FBAcAGkVdcUR3W/h7c=;
        b=oc+qA1v+m8ZJGEKPfdZgxx8r7+kVVDbwsn2l62EmRfdtT6mvqr8CYJfYvyq0NbaXMl
         B0eIbAxgynY84yK2kZkyLsJptyHISCvQo8XkGuEn496nT66DZ+2+YcA1BQxITYO4b5mN
         bihzbQtVpVoC8JwYrMI3YyXwXkekSwrGTmreYEVgRUCJPYoG7RXvZoFEe2GWSZlr1mJC
         mqB3ELfLof4NUNO3zzqP6JHV2L36EHEOAkXI7l1F0HgxjodmiU/meSSMWLxR/inkv5Oa
         a1aw+RS6aW5b7mp9MsIELm72heCAtk9Lj6TU8xbkMnAL2kQyERj1eMTNsONjo+OfVWQt
         2Bmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jn48igS3IBXvOF+EgMV6gXOl/FBAcAGkVdcUR3W/h7c=;
        b=TNJn9Z0hu5c+bY+tFhYDpLWJ9MoNJdVesGGjr/XXqOKxGc5WQwbTPkbMhB5qjF12B/
         02W4I32hpdRV/zCeF3ObockMoyMQSPQxusf0ml+YNG3jMULmEemjJKrZIkj7s2uGDdLa
         yKH7Xgv5cRTkCSxa0gescRmt/fve68JeUkToDwXtRhGIXLtUi7bfaXYMybDPMJaT8RSp
         CPCPCZeoJGKV3xZECa7/4GIARpfjfHt0lb5GB7+PAe5/OIHtFTg2d+d2CQuHMqB7Yd0j
         8AApa7/1k0uSBUaPMF+QGLoIV40AuW2MY2wZCtOsgqzEuY+maf0ZGdObBUG2NkiDM52Y
         O7sg==
X-Gm-Message-State: ACrzQf0KReFpI47b7StFcCIo3H8aT6hpa7wXxaFrleWJBBIxArbHt5Oz
	XRwnFKUaXOrGB8ddiTPRj6rxJqXWUDHdWWieYrE=
X-Google-Smtp-Source: AMsMyM6zU8ESu6fo+vQq0wRW7221W7DcZYCUYmGGOlmdlzdT+GsowkFTOswei+XFKlJtDFMsVhTSPe5TcjMwVRmzoaA=
X-Received: by 2002:a2e:a4a9:0:b0:277:2544:f945 with SMTP id
 g9-20020a2ea4a9000000b002772544f945mr5119228ljm.39.1667205008477; Mon, 31 Oct
 2022 01:30:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <87h6zklb6n.wl-tiwai@suse.de>
In-Reply-To: <87h6zklb6n.wl-tiwai@suse.de>
From: Steven Noonan <steven.noonan@gmail.com>
Date: Mon, 31 Oct 2022 01:29:56 -0700
Message-ID: <CACv5JCJLSJ0G0jfQnucBwE3z62s6eSAYyyWW8U6FLfgn6P0ELA@mail.gmail.com>
Subject: Re: [REGRESSION 6.0.x / 6.1.x] NULL dereferencing at tracing
To: Takashi Iwai <tiwai@suse.de>
Cc: Steven Rostedt <rostedt@goodmis.org>, regressions@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

I hit this same NULL pointer dereference on one of my systems, trying
to boot with either 6.0.6 or 5.15.76. Unfortunately it happens fairly
early in boot during network initialization, which makes it
frustrating to recover from.


On Mon, Oct 31, 2022 at 12:24 AM Takashi Iwai <tiwai@suse.de> wrote:
>
> Hi Steven,
>
> we've got a bug report indicating the NULL dereference at the recent
> tracing changes, showing at the start of KDE.  The details including
> the dmesg are found at:
>   https://bugzilla.opensuse.org/show_bug.cgi?id=1204705
>
> It was reported at first for 6.0.3, and confirmed that the problem
> persists with 6.1-rc, too.
>
> The culprit seems to be the commit
> f3ddb74ad0790030c9592229fb14d8c451f4e9a8
>     tracing: Wake up ring buffer waiters on closing of the file
> and reverting it seems fixing the problem.
>
> Could you take a look?
>
>
> thanks,
>
> Takashi
