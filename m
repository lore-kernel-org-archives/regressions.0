Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA65819
	for <regressions@lists.linux.dev>; Sat,  6 Jul 2024 00:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720224729; cv=none; b=kStgRIk7xl394zCBat3NKp7jP4WH1JZ4S1uiMLcKJvtOqWvBiUPxFhKTSkJ2Gv4+6Or8wfSbEdkVOAfOunlTfBpkVEZyWa4muqawYKXAIpQBa4DQmlxvh0ZPwMlWjxeuakRdo7nH50+FkXsi72c2iWC4pjYD1zLy14vBVYUtItI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720224729; c=relaxed/simple;
	bh=k/fo/4vLr7G1b5FnRs+xhoG2wyCli0F4i6F+itX6vlQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GXuMKd3wlRCwmWtTIzBdE7MWBq02sMmy70mfL55NAaJ6VcOS1lOgX920Q8KSdj7EI9z5i2kajye8OiOpzhJEDw+V5Fz9kUezgGZ9hg0Z3kq2IRHvt+PWgoW1lQ9nS2Tr14dOb8Ui0jKYmTNNyegY9c0o4Bn9l0p6DsJcqC5OBPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WJKltAGq; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WJKltAGq"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-651541b4d40so20711127b3.3
        for <regressions@lists.linux.dev>; Fri, 05 Jul 2024 17:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720224727; x=1720829527; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vBTT/deLqJ1bwFj4A2vyIjvPYow0/EdCovNSuo3+N+c=;
        b=WJKltAGqxdvu5CsCHthGfWC3wo0HJ546pjoJMf/iZ8eJUIcKh4qfUdVb5U8PPJZO8j
         u1bNzSjOntSvL2DVtaINzSY2yt2SxqyrTjCLZKmX9zTjWPdVMVgqxOp5H+wPSHfuriRd
         zsOnsQuT32FWymHDUUt6cA/iISm1YLG4U8hiIPqMl2BLQnaLEGChI3DkLayc9TpfToE5
         w4BeYGVfbSbgMFYf2z7/fRfb1BjMHxtpY51bIOVs6eo1PESMEqAWz7i01HrgmrexvzBA
         m1CzFy1NeqbyO9yFSyBpkVwxbx7os7JBiWp7HCVmsT/aON256DJJ+sK5gEc0ujqBIzkD
         0JiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720224727; x=1720829527;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vBTT/deLqJ1bwFj4A2vyIjvPYow0/EdCovNSuo3+N+c=;
        b=ZLZ1XmCIoAjesrZnvQVOd2F9aLakNbDA+EtibPwqBEDCvtosmIUixIbKyFq2Lh1K89
         wKi4iDJ3AdexBiRC0b7QJdk+b5ct+2VyTEEYM+aUs5tC1S7TrMfsWDTKARo2sDRsEGsJ
         INbm+r4dpI+O32giQpn/O54bShcttQonXoFGl4x1r2tN3v2ZiXSfx1dtrlda7YUtteTP
         P+qeRDuUVssamK3yoaZZBVjHPzu2pGCT33HOjAbzZdTcUJm5ax3u5cfuupILM+c4N0+q
         QZshb59TU4JCAoAmlNyXSd2RpNGl0bkPcArqQqupHfk0wByA5PeWou6BXatuuMUvJWPM
         M9EA==
X-Forwarded-Encrypted: i=1; AJvYcCUKbhDcdS5rvLHt2q8kAdWqzRGZCwgyXajLhh8bcj8zFXDW9kifNhJ+7kBjXUa0GwBUIkuArWsQjOPF/1T/tPr6hn6xzxYd0oSZ1Ls=
X-Gm-Message-State: AOJu0Yy4bXbIW/CqMczlzlPaNAw84l4bnHj+1s23Ac8/pRf9CYt+ujo4
	Levh7Dd1kgolehj8MGnhsZWaGmATATZ4bfM8DLeMaR2//mGcSdApg1BNJSEAw0udxDSmMHY4Vdy
	qKoTVSK3JR09DT80eV3YMgAi37AY=
X-Google-Smtp-Source: AGHT+IHl00DB5lXcnle5oez+bUlSAk/kaG3U9/6sbycSjRwDjbucmdsBlfppNjNxMo8MiIyhZDs9xcQeWqjD0WI54YY=
X-Received: by 2002:a81:8303:0:b0:62c:c62e:e0db with SMTP id
 00721157ae682-652da927280mr54086967b3.44.1720224727260; Fri, 05 Jul 2024
 17:12:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CABXGCsMmmb36ym8hVNGTiU8yfUS_cGvoUmGCcBrGWq9OxTrs+A@mail.gmail.com>
 <CAL3q7H4yBx7EAwTWWRboK78nhCbzy1YnXGYVsazWs+VxNYDBmA@mail.gmail.com>
 <CABXGCsMWYaxZry+VDCgP=UM7c9do+JYSKdHAbCcx5=xEwXjE6Q@mail.gmail.com>
 <CAL3q7H7Xb9FQx-5PMQtK_-reMq-cbfysCx6s-ZOWL1FUPSm8sA@mail.gmail.com>
 <CABXGCsP9tSwgR4dN-k97maqHB1KOtykakmHNz78SYbAuHydUTQ@mail.gmail.com>
 <CAL3q7H6vG6PEKjcsXtSuq=yks_g-MczAz_-V96QSZCs9ezRZpg@mail.gmail.com>
 <CAL3q7H5RC6dinsA2KLtus07jxDuY1PecPXbhYOWtW+nVyzXwuA@mail.gmail.com>
 <CAL3q7H4MiarsqxSMc0OzY2TNRk8J7Lg+89MaPHY2+NPO-EcDgQ@mail.gmail.com>
 <CAK-xaQYYx6SPQaOVwL+ardB0y5LzYJw9a_hfWWtVEZ=y1rXq5w@mail.gmail.com>
 <CAL3q7H74jpSoMvvkSvmrtB_VGiscz8zN5aHnApWuYU+hpKe+rA@mail.gmail.com>
 <CAL3q7H6V9M0B4jmW79keUtTdjWsabyWZeU5g4KEN5_-a+wEHVQ@mail.gmail.com>
 <CAK-xaQZ=c7aociwZ5YQreTmT+sBLGdH0rkTKmFzt4i_mrXBmgg@mail.gmail.com>
 <CAK-xaQb2OrgNOKKXp8d_43kqMNyuHxS1V8jSDL6PdNZPTv79+g@mail.gmail.com>
 <CAK-xaQZ25nyCeOvMs0G31sL7R71dxQqZhx61cYzTK7rZD-JxeQ@mail.gmail.com> <CAL3q7H4D8Sq1-pbgZb8J_0VeNO=MZqDYPM7aauXqLHDM70UmAg@mail.gmail.com>
In-Reply-To: <CAL3q7H4D8Sq1-pbgZb8J_0VeNO=MZqDYPM7aauXqLHDM70UmAg@mail.gmail.com>
From: Andrea Gelmini <andrea.gelmini@gmail.com>
Date: Sat, 6 Jul 2024 02:11:50 +0200
Message-ID: <CAK-xaQaesuU-TjDQcXgbjoNbZa0Y2qLHtSu5efy99EUDVnuhUg@mail.gmail.com>
Subject: Re: 6.10/regression/bisected - after f1d97e769152 I spotted increased
 execution time of the kswapd0 process and symptoms as if there is not enough memory
To: Filipe Manana <fdmanana@kernel.org>
Cc: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>, 
	Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, Btrfs BTRFS <linux-btrfs@vger.kernel.org>, 
	dsterba@suse.com, josef@toxicpanda.com
Content-Type: text/plain; charset="UTF-8"

Il giorno gio 4 lug 2024 alle ore 19:25 Filipe Manana
<fdmanana@kernel.org> ha scritto:
> 2) Then drop that patch that disables the shrinker.
>      With all the previous 4 patches applied, apply this one on top of them:
>
>      https://gist.githubusercontent.com/fdmanana/9cea16ca56594f8c7e20b67dc66c6c94/raw/557bd5f6b37b65d210218f8da8987b74bfe5e515/gistfile1.txt
>
>      The goal here is to see if the extent map eviction done by the
> shrinker is making reads from other tasks too slow, and check if
> that's what0s making your system unresponsive.
>
> 3) Then drop the patch from step 2), and on top of the previous 4
> patches from my git tree, apply this one:
>
>      https://gist.githubusercontent.com/fdmanana/a7c9c2abb69c978cf5b80c2f784243d5/raw/b4cca964904d3ec15c74e36ccf111a3a2f530520/gistfile1.txt
>
>      This is just to confirm if we do have concurrent calls to the
> shrinker, as the tracing seems to suggest, and where the negative
> numbers come from.
>      It also helps to check if not allowing concurrent calls to it, by
> skipping if it's already running, helps making the problems go away.

Uhm... good news...
To recap, here's this evening tests:

Kernel 6.6.36:
   Fresh BTRFS: (tar cp . | pv -ta > /dev/null): 0:03:53 [ 231MiB/s]
(time and average speed)
   Aged snapshots: (tar cp /.snapshots/|pv -at -s 100G -S >
/dev/null): 0:02:20 [ 726MiB/s]

Kernel rc6+branch+2nd patch:
   Fresh BTRFS: 0:03:14 [ 278MiB/s]
   Aged snapshots: I had to stop. PSI memory > 80%. Processes stucked
for most time. i.e.: mplayer via nfs stops every few seconds for a
while, switching virtual desktop takes >5 seconds. Also "echo 3 >
drop_caches" takes more than 5 minutes to finish (on the other two
kernels, it was quite immediate).

Kernel rc6+branch+3rd patch:
   Fresh BTRFS: 0:03:40 [ 245MiB/s]
   Aged snapshots: 0:02:03 [ 826MiB/s]
   N.b.: no skyrocket PSI memory, no swap pressure, no sluggish results!!!

Now, that was just one run, I'm going to use this patch for a few
days. Next week I can tell you for sure if everything is right!
For the moment it seems we have a winner!
