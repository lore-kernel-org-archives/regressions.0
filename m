Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B1C223DC6
	for <regressions@lists.linux.dev>; Thu, 18 Sep 2025 02:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758161090; cv=none; b=uhBf5RxakfBO9vE5CH/PewhyvvJe+Fwa5Dy6e8hJxha5A4gHeihLztZN2NP1UdrYw4dh6CSftPjtUuybZ3OndaJAXIeGOGuwHItdiO3jfNRUOGKBwD8LM3l9Oq4p8iQeUEK4/9875wfSL+Spag6wUXWWiQd1ZAWPfKYjOH5364A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758161090; c=relaxed/simple;
	bh=aAq3GpDO8dHD59hiZUOgm8+s3e4FokNk1g5m+eFePys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GfUA18VJIvvn6hnVC0JXZL3PBLMPRDRVgn4G5uok2SgFyQlzqzradhFKbmP1j2CQ8QyUHgwAKM42aNLB+X+mwf3ofTuOTxM1R1qBfMEH8fpGSvs3llZCUtJ13ucSXnx6FIbOjB2FadUIvbQhOlIsd1va861H4GNEvLGqzmk8PYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=draconx.ca; spf=none smtp.mailfrom=draconx.ca; dkim=pass (2048-bit key) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b=p4PuzvfS; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=draconx.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=draconx.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b="p4PuzvfS"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-81076e81a23so64586485a.3
        for <regressions@lists.linux.dev>; Wed, 17 Sep 2025 19:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=draconx-ca.20230601.gappssmtp.com; s=20230601; t=1758161087; x=1758765887; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Evg9VjC868jXEyq9jooY+5VpA/zgsMZDDv3GTIqYmAI=;
        b=p4PuzvfSI4TmZI6ncWjoHb0dYkOURfsCqedSnfalz0nksDzdIdBiSY2zTzyETk6nZU
         H1ml1T6ULPi2UAoWSb7FvHN2BzKzDetxtJgNg5zEqiLShlkGQNAOTbleW194GndmyueR
         lIp7QQ6QFRmytJ34eRroyxWTflt8YCXDQ6jaEUXUF27l4TnvONC4uixkXKRMaw72YaBl
         DKvsodjlgHd9Vbiz9qz0dQBVTHSaO1Z2s55upqRTuqSIg1RpW2vpAnzP7Ny1F2QE8voU
         klhVp7IdVQ9GiPBsSr8APHRBk2NhMuIrjfInLbVr7d39qM50/bK0Mj46ldexuOELxz2C
         5Thw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758161087; x=1758765887;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Evg9VjC868jXEyq9jooY+5VpA/zgsMZDDv3GTIqYmAI=;
        b=Bxw3+sMAZ7s9JYOZaWzEDGLpo8NUmZiR0rPtm94I4dokXD3s2D/jiVt33cv0hKA/JJ
         ViAdaQNAg+FuQy02cCUB2fvQmDAeB7qAFsqRSUh4N49G+XzOoC5HFIy5ZSiYmyH3KuBP
         kfVl3clGxkQCEDT0UoslnB/q1pPlGUgdy8Y2BEdJyYrPXBrl75jxFfC+PchFtx1jlEDD
         q5vQJ1TylPF6AgLfYzFojiuoiHXkW2Xqno2BBmzbNz39VwkUC1gVl0/mhR1EAupNwSd+
         g2ZjClCeHE6fPsO15W50teMXwvz9L3pPFf8szhnBd/kQXur7p71LcEXGNc+bUmjXI3b6
         l0dw==
X-Forwarded-Encrypted: i=1; AJvYcCVnNirpsRMp4PXakzhWm6p99setTm83fjVT/rCazAxbKeRURIVd8xMKJqwhCVgqDRrtOLRPLes+G1JUPQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwPliR0e51eGUW5l3XaCsdK3AH3OhpU4bmbdV6NmDRocqbiYsAu
	hhjdz8gZyqQ3oNaBlNGmQkojCeK5spZDT6JO3TZX30A30OwRS/ZHk7oDQA6GHh3TLx3a2o3xvcO
	XIHIA
X-Gm-Gg: ASbGncvekMt+dg1vzgwBIq2xUl1FzNdC+Gu+AkIjAvQ5yfZtENkzjE7MpsMuLEHXIZ7
	abZCge0K46r9qgFYOgxVhuFXvh3N0H3Mj+L64v9Oyb5h3tjbAseFYBKwL3XH9kk/4sjmRFHbfUu
	JV2URpPJ/Jjz9lnBfRruE8Omyq55meFMTsVQ4AL1v7H8WLIZjYjExqBhDxKB5er9pLsKrkDehl5
	aeogYjKZfbXZpiPE0zovv3ZRB9zIeBKQUbDMtVmGquX+9eHUgk2MzSrKFzp15x+hmMncdKS/y8r
	QMIYxuunO5jh1+JpEiCeDjlDBXYcrXKZIlgMQ9f+wxlHxrhz+hWhHdl7YBpFSbOSbQfQbkF1BrR
	DPPuq67r4p0DX9uzaOUDoXc4PLf4mP5mVMPTVIk1wYsEVu+6EJ3v4jQiZLKdJaXSfaYzfP2M=
X-Google-Smtp-Source: AGHT+IG/GLEg3wUhCq3zxQNU9mkogat7dWnRYMeJFqt+fW2ti/BtmCrgt18+eulLSnVkk+XU7zUx4w==
X-Received: by 2002:a05:620a:2607:b0:835:fa34:5bbe with SMTP id af79cd13be357-835fa345d06mr276881485a.36.1758161087152;
        Wed, 17 Sep 2025 19:04:47 -0700 (PDT)
Received: from localhost (ip-24-156-181-135.user.start.ca. [24.156.181.135])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-83626595a14sm83375485a.12.2025.09.17.19.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 19:04:46 -0700 (PDT)
Date: Wed, 17 Sep 2025 22:04:45 -0400
From: Nick Bowler <nbowler@draconx.ca>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Doug Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, regressions@lists.linux.dev
Subject: Re: PROBLEM: AST2500 BMC video output disabled by reboot (regression)
Message-ID: <cox6kpackepnunrlhpsssvgdmjd24477cc7mide52xptmmoxyr@ijjotb3xju3v>
References: <wpwd7rit6t4mnu6kdqbtsnk5bhftgslio6e2jgkz6kgw6cuvvr@xbfswsczfqsi>
 <CAD=FV=Xp7zOQ2iEVf896P074RW911F-e2Qa36deD0e8fWksFBA@mail.gmail.com>
 <u7ek3ccya4c3c4rteliskjjfczpmrt4vmqo5c6kjdotxdgitn7@ko24dpb35pq4>
 <ef6558a9-c44a-4c66-967c-187f260f73e1@suse.de>
 <xeipdyk2i2lpkg4rrvz4cl2l3ch62sl4zoa73qvlms3ek3zkci@y7xqbgjulaet>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <xeipdyk2i2lpkg4rrvz4cl2l3ch62sl4zoa73qvlms3ek3zkci@y7xqbgjulaet>

On Wed, Sep 17, 2025 at 11:14:45AM -0400, Nick Bowler wrote:
> On Fri, Aug 29, 2025 at 03:07:14PM +0200, Thomas Zimmermann wrote:
> > The ast driver doesn't do much during shutdown. Could you please out-comment
> > the lines at either [2] xor [3] and report on either effect? These calls
> > turn of the video chip's memory access and sync pulses. Not doing that might
> > resolve the problem.
> > 
> > [2] https://elixir.bootlin.com/linux/v6.16.3/source/drivers/gpu/drm/ast/ast_mode.c#L835
> > [3] https://elixir.bootlin.com/linux/v6.16.3/source/drivers/gpu/drm/ast/ast_mode.c#L839
> 
> I can try this.

OK, I tested 6.17-rc6 and reproduced the problem on this version.  Then:

  - Deleting [2] (only) appears to make no difference whatsoever. That
    is, deleting the following line in ast_mode.c:

      ast_set_index_reg_mask(ast, AST_IO_VGASRI, 0x01, 0xdf, AST_IO_VGASR1_SD);

  - Deleting [3] (only) appears sufficient to make things work again,
    that is, deleting the following line in ast_mode.c:

      ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xb6, 0xfc, vgacrb6);

Thanks,
  Nick
