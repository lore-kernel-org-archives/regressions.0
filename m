Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2416810FA
	for <regressions@lists.linux.dev>; Sun, 16 Apr 2023 20:49:12 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id dm2so59243108ejc.8
        for <regressions@lists.linux.dev>; Sun, 16 Apr 2023 13:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1681678151; x=1684270151;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ZEsb5dT9JO5UxHpI/ZZDj8yyg+vAiJhotQU2y6VbC0=;
        b=QX1O63B1DvlmEfOLY2QXMfeqpmL7wzaN6e34rXqconsismbTHRfm+OvrZx9KKD5GDD
         ayLdp006S4kuoFXsEf/zMKdJYZx4kLyEG6pgwTbegWE9o1cwA8C6nl55UwrX4o0F9Pv4
         w58HMUm+NkHp6anSt1+Vv7py/HxRIQmeZ4USE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681678151; x=1684270151;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0ZEsb5dT9JO5UxHpI/ZZDj8yyg+vAiJhotQU2y6VbC0=;
        b=LAcRJbVzeC4p3yUXs3Ujksf9n/vtAi5CHR+Pi10KysVjZycW8XIMa6HjbQfvvoWrj2
         dDPIh9F+spuYFHWuNCzQxUev7H4NIWPrPpH0Uzf771+LqeftbOKk5T88sufMZ9VnduiB
         JvORT8pLpazCCU1/qX1Nqp9tl6A7VzvsNfmaHRBi2AXoptXMwDCjd7LxVTSHdQUYhnoX
         6hMpYf9HVa3eWZC+ylOZ40rT6FaWH6S9ZI4UYqQ/hy95lz3BAeHEZaMgaFksUGgqa5A4
         OCGi70WUBXef72g/lLS+yE09+RmxkQVLUiiE/5xOMV7iL37NSzBExFvApWRYaIMPFNgB
         bvBg==
X-Gm-Message-State: AAQBX9faYp31sf1TUDdATD78ksy0HGeaG1rtOPh6RiD/QaqDwTfWAgNY
	mkmCcUq9yJ0+KACNGQw6V06pgYzyZ9efDMprBTx0og==
X-Google-Smtp-Source: AKy350ZTn1aSa0aMEP1INx5e//i+zeK2tXoHdmOAIVAamGFyoEbzF5FYcuWM0F7PWoHPHbFQGDhNvQ==
X-Received: by 2002:a17:907:7b0a:b0:94f:2840:14c9 with SMTP id mn10-20020a1709077b0a00b0094f284014c9mr3583569ejc.62.1681678150689;
        Sun, 16 Apr 2023 13:49:10 -0700 (PDT)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id z18-20020a1709060ad200b0094f7b713e40sm388252ejf.126.2023.04.16.13.49.09
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Apr 2023 13:49:09 -0700 (PDT)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-94a34a0baf9so544548066b.1
        for <regressions@lists.linux.dev>; Sun, 16 Apr 2023 13:49:09 -0700 (PDT)
X-Received: by 2002:a50:8d5d:0:b0:506:833e:6129 with SMTP id
 t29-20020a508d5d000000b00506833e6129mr4215411edt.2.1681678149466; Sun, 16 Apr
 2023 13:49:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <168166781352.1843526.278570500979918184@leemhuis.info>
In-Reply-To: <168166781352.1843526.278570500979918184@leemhuis.info>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 16 Apr 2023 13:48:52 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjQaxmXTR68VnEJvLgB=H2agMTrrF4EXkXT4Hbdf2ZuMQ@mail.gmail.com>
Message-ID: <CAHk-=wjQaxmXTR68VnEJvLgB=H2agMTrrF4EXkXT4Hbdf2ZuMQ@mail.gmail.com>
Subject: Re: Linux regressions report for mainline [2023-04-16]
To: "Regzbot (on behalf of Thorsten Leemhuis)" <regressions@leemhuis.info>, Rafael Wysocki <rafael@kernel.org>, 
	David Sterba <dsterba@suse.com>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 16, 2023 at 10:59=E2=80=AFAM Regzbot (on behalf of Thorsten
Leemhuis) <regressions@leemhuis.info> wrote:
>
> Wake-on-lan (WOL) apparently is broken for a huge number of users since
> 6.2 was released[1]. This is known for 8 weeks now and about 4 weeks ago
> it was bisected to commit 5c62d5aab87 ("ACPICA: Events: Support fixed
> PCIe wake event") we immediately could have reverted. The developer that
> looked into this was even willing to do the revert late March, but then
> got discouraged by a maintainer [2]. But well, a fix was apparently[3]
> finally posted for review last week (to the acpica-devel list); with a
> bit of luck your might get it next week. Still a bit sad that 6.2 is
> broken for so long now, as Greg wants to see it fixed in mainline first.
>
> [1] https://bugzilla.kernel.org/show_bug.cgi?id=3D217069
> [2] https://bugzilla.kernel.org/show_bug.cgi?id=3D217069#c50
> [3] https://lore.kernel.org/all/754225a2-95a9-2c36-1886-7da1a78308c2@loon=
gson.cn/

I find that bugzilla discussion very confusing, it's not clear what
the status of the patch actually is.

And the sane lkml thread just says "the patch is under review" without
actually saying *where* said patch is, or where the review is.

It sounds like it got perhaps into some internal ACPCICA queue? None
of those links are very clear on any of this.

Rafael?

> Another issue from the 6.2 days still not fixed are a huge number of
> DISCARD request on NVME devices with Btrfs caused by 63a7cb13071
> ("btrfs: auto enable discard=3Dasync when possible") [1, 2].

Yeah, automatic discard is a broken idea, and that should just be reverted.

The number of devices that have *horrible* problems with discard is
too high for any kind of "do discard by default" logic.

David, please don't do that. Just because discard happens to work well
on some disk, *you* care about, does not in any way mean that "do
discard by default" is sane.

Discard needs to be opt-in. Not out-opt.

                   Linus
