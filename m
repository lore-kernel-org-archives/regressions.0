Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E2833161AB
	for <regressions@lists.linux.dev>; Wed, 17 Sep 2025 15:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758122090; cv=none; b=Ez7dU6y2oF0kJb0WN4WsssCEj/DKEjdMaLQtXHJJ+zLZ6OObq1WvIYK2prfGL1JfbkiOrDZjdlxs4YKRrMgh47ACFhL+IsNgLsgBF6zN1hnvsvTf5xvHymMOhrsrKg0eNXo4Y6fdnZ6olO9Ik7FeIiX0ToAGpJ2ISVoahI6gbto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758122090; c=relaxed/simple;
	bh=BJGW2dTrJ5vL37y1VD5hJsGeiolH7Qgx6xvbYYe2VoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ReSy4pk59XSIQVzDOBFGjdDzX5kNRspRkwMrUjPF2PxlH9P1VdCGGYhgKYv4kJx9qpyRE99dS+2KBID8mlbmEIEiCx6IIAkXGUBgkzDhAjKZIvbEvAW0QzAY1JeKiFiRPqrAqoUyjUVD2zNBz/yQVwq/tnAWupxd8NcLSXBsKkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=draconx.ca; spf=none smtp.mailfrom=draconx.ca; dkim=pass (2048-bit key) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b=BiN3k+kC; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=draconx.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=draconx.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b="BiN3k+kC"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-77766aae080so8716946d6.1
        for <regressions@lists.linux.dev>; Wed, 17 Sep 2025 08:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=draconx-ca.20230601.gappssmtp.com; s=20230601; t=1758122088; x=1758726888; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v6NrCcDiMgz4BfT37/6MfLkoGQSFwd3bQQCaY08TYjM=;
        b=BiN3k+kCm7oM4Y9PQX6Aeiw71mBrp5vk89RHl14Kv6ax3ca2JYl93sE0ZcvBsepFEz
         IiJBHVXbpA0l6Z8Dvot72o+KmpBbA1XlFEKGPnqnj9L9Ee/kO+DMDl9ir2+FC1NC0dUz
         A2wtXQBHVEVoHYmr9umoXZpFpc4+S0z9hfxeUhVF0lEO/cEXL+IBnBKIMMEP08z3nJmw
         dY7tUqFPOnu/6eOXb1I9ladgoZ+z6eUp+zJiPqnjmdkxDTw8tXEy+YWB3FjKJF4L66+b
         U4N/SzbCe8FGxc8Ff0//OuTQ7tQIGn3EoVDZTcbJo5r4qR1OWuxv1Szpo6YjEJyhIzN6
         Pxog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758122088; x=1758726888;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v6NrCcDiMgz4BfT37/6MfLkoGQSFwd3bQQCaY08TYjM=;
        b=BB5JX8R3G41RpKDSUfXIiSuqC2/9BtewS6D8q1VLJweVivAe6PuTBeGmBOaLLTxguF
         Dw230WlA1jCrf1qvgnj4DxO77MW9PCzEnAynuQlvrZppxaKQ8Abqi/4/J7xvWzf24J6K
         T59p98cq0DRZvfEYpuEC3AtCcnw7V0NwD3OZQEO7qS3RRJzSPc5IccZTcdm4AzDJGpxc
         0yE3sJgPA5VH6QjbEYTNEDgV1pKoA5SJEiNSaCtr2xzPe3jOkENzR6GUtfZpwxEz3vmy
         oAWn+pRw34EShV9F4oDq4SFizRrd2d3ZxwNxhsxAGn3t5AiEcNurXOoXOs6sP5jW0MKh
         djfA==
X-Forwarded-Encrypted: i=1; AJvYcCVHMbgAOJAWS6GPGuahvRUq2Ce2AJ9Qi+gF0VUA4YbtsxLU5QA3XKUiJQGBarloJcYBsXXPy6v/Sbl3HA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1z/ks7oQRgO7z/x7YKkrJhoZZS14CG9Y3Rffjbk7V8JDm3VVs
	MYq7eGb3gfAs6sNy01/l1IEIuvbshGoQti/wrBbR07NKcfEWs31JLjrfSPhczSckJLU=
X-Gm-Gg: ASbGncucge7wGwUyY9txrbdcSgVBV4G237MzOgO9CjkFvpHFufleTVbWeSJaHQVl+6c
	C7UF1VvaPGN+6mgrOnacKg0El5OXDLWr1gFnaIgHLRM3F2x9NN3o8ZAmYPWtXkZImaC/bKqy2Xj
	lcrP4PZqCE/NTryAmq5+0mzG7ztz7uVsHjjXoGW4PZcKYO4O19loGc47MlbF8J1+ZUkj44yoZBY
	JqSMLQA+5bxVXfDWtPSdqfhc2FkQyIIWRHSQGzzaQcDLBDwrWF4tRs3tYNVqS7hRv4fh91G2NPc
	7Z6VgC8fnDS+cGXrUxD2OtbC0Bd3pxd1LKLtGMi7jC9U40HaUzNeLXfwM9IU6zskT8fQUgHtO0x
	EKD1z8hwSDiMSN2vRHBX/0Y3MQDnmwiZqCt6/7xeZATfcRTQGq9Q=
X-Google-Smtp-Source: AGHT+IGd/ABHMF4f3Hvae/ZzKRbwMwLDu0yyj04cHbrYciDrdwe6HnEu0vohHTaXLEoMoD8R1qEw/Q==
X-Received: by 2002:ad4:5b84:0:b0:77e:8d71:c335 with SMTP id 6a1803df08f44-78ec6177b6bmr28182516d6.19.1758122087595;
        Wed, 17 Sep 2025 08:14:47 -0700 (PDT)
Received: from localhost (ip-24-156-181-135.user.start.ca. [24.156.181.135])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-77cb4cf2a35sm65042936d6.51.2025.09.17.08.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 08:14:46 -0700 (PDT)
Date: Wed, 17 Sep 2025 11:14:45 -0400
From: Nick Bowler <nbowler@draconx.ca>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Doug Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, regressions@lists.linux.dev
Subject: Re: PROBLEM: AST2500 BMC video output disabled by reboot (regression)
Message-ID: <xeipdyk2i2lpkg4rrvz4cl2l3ch62sl4zoa73qvlms3ek3zkci@y7xqbgjulaet>
References: <wpwd7rit6t4mnu6kdqbtsnk5bhftgslio6e2jgkz6kgw6cuvvr@xbfswsczfqsi>
 <CAD=FV=Xp7zOQ2iEVf896P074RW911F-e2Qa36deD0e8fWksFBA@mail.gmail.com>
 <u7ek3ccya4c3c4rteliskjjfczpmrt4vmqo5c6kjdotxdgitn7@ko24dpb35pq4>
 <ef6558a9-c44a-4c66-967c-187f260f73e1@suse.de>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ef6558a9-c44a-4c66-967c-187f260f73e1@suse.de>

On Fri, Aug 29, 2025 at 03:07:14PM +0200, Thomas Zimmermann wrote:
> it's been a while since you sent this report. I assume, the problem is this
> there?

Sorry, I haven't had much time to try the latest versions, the most
recent version tested is 6.15-rc7 and the problem occurs there.

I have just patched out the shutdown call in the ast driver and
everything is fine.

> Am 30.04.25 um 15:28 schrieb Nick Bowler:
> > On Mon, Apr 28, 2025 at 01:40:25PM -0700, Doug Anderson wrote:
[...]
> > > 2. Could you give more details about what panel you're using?
> > According to the documentation I have for the machine, the video output
> > of the AST2500 BMC is connected to an IT66121 HDMI transmitter.
> 
> That dmesg refers to a SIL164. I always thought these where only for DVI.
> With the IT66121, I'd expect the warning from [1] in the dmesg.

It's not impossible that there is an error in the documentation.

Although the comment in the driver right above the linked code suggests
that it might just report SIL164 even for other kinds of transmitter
chips?

> [1] https://elixir.bootlin.com/linux/v6.16.3/source/drivers/gpu/drm/ast/ast_main.c#L196
> 
> 
> The ast driver doesn't do much during shutdown. Could you please out-comment
> the lines at either [2] xor [3] and report on either effect? These calls
> turn of the video chip's memory access and sync pulses. Not doing that might
> resolve the problem.
> 
> [2] https://elixir.bootlin.com/linux/v6.16.3/source/drivers/gpu/drm/ast/ast_mode.c#L835
> [3] https://elixir.bootlin.com/linux/v6.16.3/source/drivers/gpu/drm/ast/ast_mode.c#L839

I can try this.

Thanks,
  Nick
