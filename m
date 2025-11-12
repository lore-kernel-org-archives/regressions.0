Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5711334C140
	for <regressions@lists.linux.dev>; Wed, 12 Nov 2025 19:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762974219; cv=none; b=eTCuFTlBmm+dJktXw5mUcbuS4fpvI4ERhVtxwS4Hd4e+5OfA5S7ntj3bi9vft4LznX1VxU0WpBM9c7cgRu5r2WeSszbAIYjR7OutCLEB9+rUTOQpWOFQGl5/38/2JDOp+fAhbY8q/0tEQ9HiAS8titwT00QMi4fmM49mJjnDZYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762974219; c=relaxed/simple;
	bh=+6kRPrLe7w4uo70mpA9CgCdWXvd2+fUGoAWuD4YTfmw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LZQYm3+/EtvJjePdOSyUO/XofQnqo6hu+k8XQYv8qcVyCMYtioNGxlJuhVJyAyJJcGefHQeEHpHs6qmeULoXPD0Zarmew+7vBEAYPzOpjEylALfvXb1sQpNEK+Ec3dmnY/bBXKkT1IjVTNzdmbRkb6CvPD+hXrjp4g34F1qMhaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U4plT0Pd; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U4plT0Pd"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-8b25e273a8dso744785a.3
        for <regressions@lists.linux.dev>; Wed, 12 Nov 2025 11:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762974217; x=1763579017; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YdjhcZLRvFus+kcjwsBa3teGlxV32hqHWcTKIUAqd7c=;
        b=U4plT0PdV8urXMztLGwPFglNImXskfdS0ewyDfOtUnb1XggXvo7Z6lW3f5UbL2bgPE
         oUr3TNkCY3P2RZ7DO7B32KyykbfP5aie5gDSYU0DC1Sbyn1YyYNmE9YurXFGoV2H1vJr
         2A6cyGwts0dG+ga8L/W8Sebg02/IDqATyhPTB/Z5SF5nCYGjYzqtigVcw7bevuI2ItD7
         IQjh5TqkH0Q6KVp1d8wJfzZ+ohbDGvRu3tyuCHwyACwjyvJJ0QKfC7udvNeCF0B6rD+m
         6csyRMRUZL7dfdVoDz/IA3ZwOuQlFjiLSxX9ibhPFi0Qbu2GZnBZy4wC3aWOG9n3f9xy
         RQ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762974217; x=1763579017;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YdjhcZLRvFus+kcjwsBa3teGlxV32hqHWcTKIUAqd7c=;
        b=BGCo4J91qdVzq5K3cTYm760qtfcOv5wSnMkkkuYSlW+gy0x19byF8xlD9uRBE3Hxiw
         3n8BcUo82l9anA+CNItBFLguHEh9uGBLAGXAUYQkv+5+6Oi0S/uE/G+QGa/1W0rwEFNG
         YLG6CnpO23rorv9cnjPgjuav5Y8E165NJQJTLSeBCUFaMIFVtQE7qnRfPSmCnU+sO/U9
         P0IAMKwHZHve9UDO2F8brGABoCcz5BBWbu9j+tLP1WLLWFSR0TS0UbBRvAejm2tljPjY
         hbW3zE5yYCD5/9utxKvlOG8cq6pQMV4YKcgr0+7DRFyWkwjV0L+vhxfSfz5jVE3h1d++
         /O1Q==
X-Gm-Message-State: AOJu0Yz/uoqHD9l5/CswASwPVjoXnjN+QaT5qi5smvlVgfo+SH7VM1q2
	xu3v7pQPfTmdGmypziJ3ktXKkm2w/LZBPCd3CEoy5fmlP2Uc+9irarOrdZOQccCBCJIE0/kZBXx
	JLyzee7qLBXPpK4GC2LibqdmueWeK+Zw=
X-Gm-Gg: ASbGncv03CoqwIEO5xgTzD540nZwfIP+/Gv1PTqojfeM7L0lGcB48/DmlXnzgmHnxUu
	gIwL+TlqHjmeYwD7IDtiXH9nv+NX2Iy07OHsfdsF0Bd25VMVmA6SELyQCWP3WZ5PR/GHAXj3UJ0
	9rfKHBHmM2mLf1ft5P1NY+whvZOGK0ppUpIW2Jtl30zDE2QMIM5ucuTfne2OWY9ljzK5/A8LIIU
	HSg4QDJ1+50vlENALVjeWYFqNYxUuP+cnAPS06uwcqzqO22rFruyb80wi8=
X-Google-Smtp-Source: AGHT+IGokqy+s9sdXB1vkT1NwnctHIiNTEtlMQdfLOcfMoghrommH2x1kux2g4jmvJk7WXhy7UIP7NSb+sidZtHX8mU=
X-Received: by 2002:a05:622a:1455:b0:4e8:ad19:99c3 with SMTP id
 d75a77b69052e-4eddbe1c835mr51464741cf.77.1762974217025; Wed, 12 Nov 2025
 11:03:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <mwBOip3XK77dn-UJtlk-uQ1N6i3nwsKticZyQdPYzQcsk0dsjXl4oOAh-Neoxv-0TlpKnt_FEJwx8ses5VJglGLJUW-bIG8KWchtoDwCnnA=@protonmail.com>
 <CAJnrk1ZDEszGbyP4cRh7+mEPu9BLmPrY9Xb-Q3HZnxXZOV7Eag@mail.gmail.com>
In-Reply-To: <CAJnrk1ZDEszGbyP4cRh7+mEPu9BLmPrY9Xb-Q3HZnxXZOV7Eag@mail.gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Wed, 12 Nov 2025 11:03:25 -0800
X-Gm-Features: AWmQ_blCyNTuehKYgW4fLviBklXPYbgTO5FW9yTn_zy4KZ44PWLv7H8yBWpXKX4
Message-ID: <CAJnrk1aepU0y55FNG3zDHhK4iPo80MtD+tE_PT+ExhD9SDUS_Q@mail.gmail.com>
Subject: Re: [REGRESSION] System hangs on suspend after using distrobox container
To: Athul Krishna <athul.krishna.kr@protonmail.com>
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>, "miklos@szeredi.hu" <miklos@szeredi.hu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 12, 2025 at 10:50=E2=80=AFAM Joanne Koong <joannelkoong@gmail.c=
om> wrote:
>
> On Wed, Oct 29, 2025 at 10:47=E2=80=AFAM Athul Krishna
> <athul.krishna.kr@protonmail.com> wrote:
> >
> > Device: Asus Zephyrus GA402RJ
> > Distro: Arch Linux
> > Kernel: 6.17.6
> >
> > Noticed this issue after upgrading to 6.16, systems hangs when closing =
the lid of my laptop. The issue is triggered by using a distrobox container=
.
> >
> > Steps to replicate:
> > 1. distrobox create --pull -i docker.io/library/archlinux:latest --name=
 test-container --home ~/Containers/test-container --additional-packages "s=
ystemd" --init
> > 2. distrobox enter test-container
> > 3. Suspend the system
> >
> > Bisected to commit:
> >     commit 0c58a97f919c24fe4245015f4375a39ff05665b6
> >     Author: Joanne Koong <joannelkoong@gmail.com>
> >     Date:   Mon Apr 14 15:22:10 2025 -0700
> >
> >         fuse: remove tmp folio for writebacks and internal rb tree
> >
> > I was able to temporarily fix the issue on 6.16 by reverting 0c58a97f a=
nd 7d0f0f06. Unfortunately reverting 0c58a97f on 6.17 causes huge conflicts=
.
> > Attached systemd journal logs.
>
> I missed this in my inbox until I saw Miklos's reply a few hours ago.
> Sorry about that.
>
> I'll try to get this set up on my VM and see if I can repro it. Does
> that distrobox command you wrote out in step 1) automatically run the
> fuse servers on the container as well? And for step 3) are you
> suspending the system with 'systemctl suspend' or are you doing it
> some other way?
>
> From the logs, it looks like it's stuck waiting on folio writeback. Is
> there a stuck fuse server somewhere that's not completing the
> writeback request?
>

Athul, would you be able to test if this patch fixes it?:

--- a/fs/fs-writeback.c
+++ b/fs/fs-writeback.c
@@ -2694,6 +2694,9 @@ static void wait_sb_inodes(struct super_block *sb)
                if (!mapping_tagged(mapping, PAGECACHE_TAG_WRITEBACK))
                        continue;

+               if (mapping_writeback_may_deadlock_on_reclaim(mapping))
+                       continue;
+
                spin_unlock_irq(&sb->s_inode_wblist_lock);

from [1] https://lore.kernel.org/linux-fsdevel/20241122232359.429647-4-joan=
nelkoong@gmail.com/

Thanks,
Joanne

> Thanks,
> Joanne
> >
> > Regards,
> > Athul
