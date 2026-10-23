Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792764516;
	b=jMB8eJeHdeeyicwb6zOZkqsek8M8LkDB1sLSXpcK9qCIJ5eu8CdAbRAMcwSVj88zDc0R
	 JltTCWyPgoMqtvrYSO/UeeU2sFvaHjB6scQmAE0uqjZxe1jMs1Guf5WmGUHpQeUPk3ca2
	 VMnZyafUv0YYt2WjpW/TB0NopnmX0xN8XGsYCCL/dkuvpetpvFZwPy7m1sDx1KTej5vIw
	 pgJCdJGqIuMOdHjCvpFE1JERfHBLUIettlsuLqnGHvmVtiZgqGrfs8divi0fzNMZgSh1t
	 xOylB0E2TMMj5TpxKRYeXZWwmJW8bQuLbAzpK5W7Wzh0OXBbWiEjF5UR0daymjsLfhA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792764516;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=S2REWJ/GvPB6717oRRTOl7lftZMNqJJK4+idsMBqa34=;
	b=1gHSMJ5N1aaaD5RQi7oCaSk89T2XaUvEa3TQLcJg0dJO2TI8/R4yuTpLbfgHr9l4f7al
	 gGMPg5Fif/Mp15VxAdTtFoGcVw59smGkZA9bbvmocAe+qo6doNxXJb1BTE5qsEQY8Pjaa
	 2Yfjiwbzqb8vvRBsQYE27Qy5297PdOyyBJmnIuzN8A22Xb72wt1/cDGW12bRsFICniBXJ
	 s9ir8ejx/p1ODIPAPmA8RzLcEJACsjLdew7AogsaH8NS4+F8tT8eZUu/ybhlAaSMtfdRK
	 Ew37Lfm2SN75AVRNN6JLHZ7LjH9lHA0n1MkvWEcsBlz2H243u3ZYByfiYk1lAwnV3tw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="enfUtfJ/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.48
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3678606A31D
	for <regressions@lists.linux.dev>; Fri, 23 Oct 2026 14:08:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3678606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=enfUtfJ/
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-706113e92f9so527483eaf.2
        for <regressions@lists.linux.dev>; Fri, 23 Oct 2026 07:08:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792764515; cv=none;
        d=google.com; s=arc-20260327;
        b=eU2fcMlW5NUSJAn3tz9GCv2BojUkiupDncDy09bSUDvXWNjlQvYthSt8jHJo86ezyS
         y7oNnCKpPObMLZpBP0wmQoli4us16m55csgfu190/W6gT/z6NBwDNt8wYDGTrfTO0EpB
         jPwCGJrsZmWDVkzPYSmTQCpJwFUlK43dwtIjwt2c52CkTZvttm3OqQGLhOUBKZNj9+ei
         TuDotOpVEF8mPjzgdfASylXb1qqAhC4ycgMmiYuU6VXGN8fVHxExU1lQVpTcl7mjQ6Kl
         04L/Sa7a0/enZ7YoeiY4WXQ32embEdltUrs2KeTnNUvwz0vWs84bZ+Vg9hZVWo1BDdg8
         cGmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=S2REWJ/GvPB6717oRRTOl7lftZMNqJJK4+idsMBqa34=;
        fh=xGQ4llExwxWk7XLR7IOqhnmbMZPMnitY2gaDHT37tfY=;
        b=ASrf85FWm5KO8PW4fddsEnZnBXTG47PyK0LFbMx38jjI6aPUpE/q+vp+Y45j8g+45Y
         //FSn9DY2tNUZIbA6VzCFHmGMJg3Q1yiiS5uXiQry//WJ63Jq4vXuqPtB14q8KbDUZZ2
         RPeQz/X5Al0/kxEvj7k8kuvD8xXM6q1rgZzG35sfoU69aSnQ5iUgSukGTLhS+SKORNct
         WWXk2nv5SGJ7yVv4FdZ3bF/zTO3eWVSYGfv7iPdEPPSw6IazV5GFYJdPe+MrQn30gH8P
         t3EEwmmAx2oGHo3x3furMrJMOagBu6JzXZ90ddyX9iip0DT3np//NRlFMeFe5U+vK8Ov
         1h6A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792764515; x=1793369315; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S2REWJ/GvPB6717oRRTOl7lftZMNqJJK4+idsMBqa34=;
        b=enfUtfJ/l2xLj0JicuYDHXbAXjaEWiI4eZBhA/NT52wjxymI82wTVT7/1d4xh4cAAh
         cB6QO6fL57PacfnxyFkvi2CRFf9SniAvV2T9af5NPR4iug5ziM7xuthHktGsPiolxU5a
         pOoyma5cOYDErVQ79SqMwJ7N5mHkjJYbARwi3cdt72RibJKHOL4UveTL1MSckHv4/KaL
         LKgYfUUbtMjQRfxhlI2mAYyBvrNFEHGpRej/tK05owpTAp5CBa0GFkndzlDebxmdvc4W
         fB/vEeSpZlmWBaLlIOx+YwKALCYXa3DNQh6MUJXJl3zsAu296XFsKjUyppcAERBLrlqM
         ec3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792764515; x=1793369315;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=S2REWJ/GvPB6717oRRTOl7lftZMNqJJK4+idsMBqa34=;
        b=kVISd/8FeA4RexshLmF4Po/HZnfTlK+aJcC2zyCf+WX1w72sYHFbHli5KLK04j1T4m
         lSBl76S5IiKxjw4AwuTUboC+tvUJel/xx7UBjQuyQTiZpTuEG65wEKC3PEwN/v1a40Hi
         6U5rxGPHrVfbwXR3bRp7piIexvZJ04J6KWeJaBBsgzmX2zyUPiOP3lDpj60TjA/Vmf5x
         oavVgMDGfs8SnEMR7Thvb25ANHWk8Yxe4WT+Zmfebasg2Enw5026Ibdr+6kd/rflvm4e
         izhCQRCv02aCitqAaq8KQKMnQ8kM8c2dqfPjf0y2vi/3pExPFml7p7fGG+zCIxhdYBEH
         RT0g==
X-Forwarded-Encrypted: i=1; AKwUvBzpEfhpo/3jD5FZsAgrtiIn213gZGnVRVyw9sS8LxGCAA7G2UpMdMpV3aH2LWx0bMetT41QDwDb8CG8Lw==@lists.linux.dev
X-Gm-Message-State: AFq9FYJcacgp7jWEdDXx53GJQOUaRpGaudZrLw9gUEESGbNIA0VO8t2z
	GuLck27uhLt0XL9Zn82zl/wnzrvHP6LG2gzRA2UGsuaHZRve5xQdX9mHHnNRmTKTcYx0+vPAtQ+
	vBnrglXAbWoV34JNNAKoUuUJ8nAmYt/s=
X-Gm-Gg: AYBFou3GEEvsmUGDOzsJWDhwNc6XJOU/3zU6nceLzj45z0eMSqlzNYHT7iK5t7AZ5Hh
	MzQ2nQozLnlAyHGqWK7JPuS+7/kQ98tV8NHuXH5wk55mwQ9R8kcWhZS0pMjRNDyUSVo1Xl7UKcB
	JN1+JqUgysytlsU76bQPjJcDE5V4V5yDayxec7jpM6/pvb2SXIil+YBEnb1RBo4vA2gnDiXJhi0
	4ZHtNRvI2C28lcba+tX6lxtvAD0hFVuHpBv/iHngxH/2cjvQgVlMJeG9L/NonZD1EJf4PNwF+VC
	3Yd3tiFxqA3XNWPEwwo4w2ZSw3MFDD5yMl9ypOe+2OZ6zxfiEstA7heWX/+YRXheYB7jYitmUz8
	61ZV160QCmlPjtjNZhVZ0KVTOoZ9oZCdsKlu79PPBeFN43H6s+mn0KPWoUX347uieaRDJM3eqGn
	eiNvZ9GA6Orp6/eAumnEpuGvwhBEISVvUnAPTO289qDvRXif7MPniqsOpiK71ldm+/kzkiAQpdN
	ZV7xS/cH5kwD0dE/KcBTfX8bOQrFsvFwOLE
X-Received: by 2002:a05:6820:4a90:b0:6df:5b31:f4b7 with SMTP id
 006d021491bc7-70b88ac3f67mr1281880eaf.88.1792764514641; Fri, 23 Oct 2026
 07:08:34 -0700 (PDT)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261020164239.3808903-1-pdmorrow@gmail.com> <20261022101915.GD708417@horms.kernel.org>
In-Reply-To: <20261022101915.GD708417@horms.kernel.org>
From: Peter Morrow <pdmorrow@gmail.com>
Date: Fri, 23 Oct 2026 15:08:23 +0100
X-Gm-Features: AclHuK8R07txa0xm0_-np_t35olNW-DUc3QolGlTZDQiIjd3HXrAI5wxtlVE198
Message-ID: <CAFcZKTyrRKS+A1cb4ZrjgbEwJpEHMVNCW=Bx+emzrBdC8H-mug@mail.gmail.com>
Subject: Re: [PATCH net] net/mlx4: always create the eth and ib auxiliary devices
To: Simon Horman <horms@kernel.org>
Cc: Tariq Toukan <tariqt@nvidia.com>, Leon Romanovsky <leon@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Yishai Hadas <yishaih@nvidia.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Eric Dumazet <edumazet@google.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org, linux-rdma@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, 22 Oct 2026 at 11:19, Simon Horman <horms@kernel.org> wrote:
>
> Thanks, this looks good to me.
> And I think the minimal approach taken here is appropriate for net.
>
> Reviewed-by: Simon Horman <horms@kernel.org>
>
> I do, however, wonder if a follow-up is warranted.
> It seems to me that the is_supported callback could
> be removed entirely. Leaving either:
> 1. struct mlx4_adev_device with a single member, .suffix
> 2. mlx4_adev_devices as an array of of strings
>
> To explore this idea a little further I tried coding-up approach 2.
> Which lead to the following (compile tested only):
[...]

Thanks Simon. Agreed, a cleanup here would be nice. I'm happy to test
and send your suggested patch to net-next once/if the reviewed change is
merged, unless you'd like to send it yourself.

Thanks,
Peter
