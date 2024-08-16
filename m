Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B9682490
	for <regressions@lists.linux.dev>; Fri, 16 Aug 2024 06:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723790582; cv=none; b=YfLw+VHVzJDM3L33MV+3y86bcKO8FbUY9en4/I4VqAKrbCPHDt8ZMEhOsjAaONmoEn+/J2EKw64qPOKEQ8dWLP0Qv2S1L7ojg1nHKrgyB4mo+g2ez9MVeSzC0kpC2oeNm6vm7lmaTiQrqXMbKXoYfrYoN7m0jRaRPIp+12+st8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723790582; c=relaxed/simple;
	bh=9MzRT6MQhoASRVKxtLl6TLviFlnQnH0RbQCnybUc2go=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=chUyrlNoAek88k1Hx7GwFn+LJislVu5zwIdFjkb1WMjsU0nUuKK00nK3cYJR0om4tZ0BYDczkuczXQzKsVa1NzdwhD7QlIMKbdqOEHk/WQc9IXaNQuDw84qGlchWL6Qm69Kw1LqlLvnWQyun7bwwNd7Zzp15pLFjussqT02vftM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SUwzyhUd; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SUwzyhUd"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-66c7aeac627so19079667b3.1
        for <regressions@lists.linux.dev>; Thu, 15 Aug 2024 23:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723790579; x=1724395379; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9984CAS7CNIQxBvvTikDkZZTlOsU6w6r8X2XroTC3V8=;
        b=SUwzyhUdaj1DmPqmlKBu45BL4RmtmIPRYZttQNi/kU8R7Pa8TW7o7KnyJRYxQX6Ebb
         thzkkV5IRRGhNzk2Fm0U+Gs7j4j6qETCPz61XSyu9PDJyqDEP6rpa/MPiWt4zxl/au/k
         PXkxhXcwGntcKkiZI/UAPkyaz0fZ3H93aYomurhb4Qrqh+YxOf5AqKPLUKuxvosSG+Ot
         oc2ovO+2lqjcvYVx9WMyWuTmAm+U29MVl6c956jP3wqqhirtyghttZAaF3ppqYTQN37O
         zd2+hTKmif3gc6c3CWIOZViToaXyhPo4y1UrCgbf1ippDfRJAUSJ5DswCLc6ZBFSgLrh
         MPzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723790579; x=1724395379;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9984CAS7CNIQxBvvTikDkZZTlOsU6w6r8X2XroTC3V8=;
        b=tryMypdoDKeGNxg61fVUKGQwuD1yXd5ZBu942IsnBsaJ+Mgjwk/nWJr+MJVqNVzLT/
         ZVRSKdG0MvlhfzIMEevGgwXMN8XFh51dALL002ye5AEAlH7l0WVMKT0NgiVOsTDWqit/
         IrSIT1jrmHwoz3r91vauJNNToRI6gHezPN+Bm5uBCJTWcy+kFoaEl9bDpAGAhFiOf6Ei
         s2hTtEKBNwsy6lvprG3kCxHLPRpKww6yFe5tsnA25caTj8yzAP+6G+A1PBiz30yusHCB
         8s0wrA/x0TTTra95mgMVaSmYtOSNveXO5CCjZsG0UCarVFvZBE6vt3YFr10PMrnciqnc
         bAGA==
X-Forwarded-Encrypted: i=1; AJvYcCUCaG1kVjULo7C/CzWN/xtElxe3WpTL1F6wNUJ2SPHiYDe2yKaME5r/USHGz1d78JEoxanNvoOTGaM1A4x8atyvVT34UMWpNZh0feo=
X-Gm-Message-State: AOJu0Yy/lDYeXSx8qt3iQnhSfTDuicBHTxsCq9bZnfPBSs2y23U3ugaB
	RgEWc+0Wu449xOgx0ehYWzYXyLIKg3zrakgguCUG/fSrPviCwqF/U1FU31j/dSaBaBbPa2nFbk9
	pmCCz/ZQPRG5HJ7neabpbyi+NlIs=
X-Google-Smtp-Source: AGHT+IFwaUdjqwZ0EpK280Y4+BayIVwVmptraNcFRsFUCRRzajjVCxtXiorbxlU3aWf+0BDjO9tNnEDrqszN/MseIaw=
X-Received: by 2002:a05:690c:438a:b0:6b0:70fc:f6d3 with SMTP id
 00721157ae682-6b1bcf8ec67mr14579087b3.45.1723790579487; Thu, 15 Aug 2024
 23:42:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAL3q7H5zfQNS1qy=jAAZa-7w088Q1K-R7+asj-f++6=N8skWzg@mail.gmail.com>
 <277314c9-c4aa-4966-9fbe-c5c42feed7ef@gmail.com> <CAL3q7H4iYRsjG9BvRYh_aB6UN-QFuTCqJdiq6hV_Xh7+U7qJ5A@mail.gmail.com>
 <3df4acd616a07ef4d2dc6bad668701504b412ffc.camel@intelfx.name> <95f2c790f1746b6a3623ceb651864778d26467af.camel@intelfx.name>
In-Reply-To: <95f2c790f1746b6a3623ceb651864778d26467af.camel@intelfx.name>
From: Andrea Gelmini <andrea.gelmini@gmail.com>
Date: Fri, 16 Aug 2024 08:42:43 +0200
Message-ID: <CAK-xaQaPbmZ+pcqFvfgtwTyMnHbMcs6j8KjgVOYBxGzGgoAJ7Q@mail.gmail.com>
Subject: Re: 6.10/regression/bisected - after f1d97e769152 I spotted increased
 execution time of the kswapd0 process and symptoms as if there is not enough memory
To: intelfx@intelfx.name
Cc: Filipe Manana <fdmanana@kernel.org>, =?UTF-8?Q?Jannik_Gl=C3=BCckert?= <jannik.glueckert@gmail.com>, 
	dsterba@suse.com, josef@toxicpanda.com, linux-btrfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mikhail.v.gavrilov@gmail.com, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Il giorno ven 16 ago 2024 alle ore 01:17 <intelfx@intelfx.name> ha scritto:
> Can we please have it reverted on the basis of this severe regression,
> until a better solution is found?

To disable the shrinker I simply remove two items:

diff --git a/fs/btrfs/super.c b/fs/btrfs/super.c
index f05cce7c8b8d..4f958ba61e0e 100644
--- a/fs/btrfs/super.c
+++ b/fs/btrfs/super.c
@@ -2410,8 +2410,6 @@ static const struct super_operations btrfs_super_ops = {
       .statfs         = btrfs_statfs,
       .freeze_fs      = btrfs_freeze,
       .unfreeze_fs    = btrfs_unfreeze,
-   .nr_cached_objects = btrfs_nr_cached_objects,
-   .free_cached_objects = btrfs_free_cached_objects,
};

static const struct file_operations btrfs_ctl_fops = {

This is from my thread with Filipe about same topic you can find in
the mailing list archive.

Ciao,
Gelma
