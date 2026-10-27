Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793075733;
	b=TDmW09vTaZvtgGazEaMsP03U04dgb+bE4EfAWIBiGDj30J6ppco36i0jmw/f3BtmE4b/
	 M3ChIKx3adeRHTtEKucP4sNz42Uc9JS3bLHrKJBaZ+dZrcv7NPrOYQbaEGy4nMWopF6gW
	 ssLBZd8uuvvNKjDNKPdEkxlA4F7xxxZHSPT1QqEa2dJr0TkhV75USJjvPoEC9OxtXfej9
	 sJSdYoUo3vyWx7SzBmUMjqRuBD7s3oC7bVntLvaAVb9dNgMX/qXLGwMlpmYpl99vaxbK9
	 meY3hv0cOSSGhKNA+W+uxCEt1x+6mg4hx5W2cSSUNW4r6mgkPZ82vwcqi5w2T3EB2Iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793075733;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lvPUnqN8PL1OAu56QIuIdIBU70pIUAL/ta7uRi0Zh7A=;
	b=kJZedHG40IHWPOLbRM1RP+EyoIylflIBDIjUaHzGhdFybyKRAv/hJyYnyFV/PF0f7Xut
	 QXh4rmgDglZ3PRsm0WkppQV5hqoexFOYu6wlNX1AVSbOEMtKtXaFCHRiVd3oJLIf0saJL
	 nJJsVYMoyjk1FYI4SNSDpOJKKRRDu5Tw1zO/cRypLQhkL/2GCT4ogLmnmt4AQsctxyDeS
	 l85tfJhkQpcrvf9ruEvD9XRv/NtW+WZlrLdtowStPYNuX2ibRIDmXpBsAwB2fLGOPd/t/
	 vaqXs6XzesvlxXeZo4U49osHtk9FKZXG0C8oAYDzhjDTH70emumm/y1RE8N+tBaccFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iQ7zth6O;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396E2606A31D
	for <regressions@lists.linux.dev>; Tue, 27 Oct 2026 04:35:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 396E2606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iQ7zth6O
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a208d93758so42486565e9.3
        for <regressions@lists.linux.dev>; Mon, 26 Oct 2026 21:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793075731; x=1793680531; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lvPUnqN8PL1OAu56QIuIdIBU70pIUAL/ta7uRi0Zh7A=;
        b=iQ7zth6Ocm9Cz7981qzLJUHzY4Xz6bCUoztrvmqrG0vhdV062i9OKKo4RKNxOaJzAz
         NTIgSjSaHIbKJB55dFdkWzt6jZm0uNO5xb8zhYeQU1P7YVBBL46eLcrxENyewSkZu3yO
         7JAUwBb+S5tIp6Vf/TzuMW9AlYws+OzFC16OSGOjxKXYy37ow2B/2qAVvTQvH+1lX8dl
         KVdOGvH0LHLyOi5cF6q/u1xv1sXt0JvAa1p2ujZYCCyjmPPeUVHuIqk3b9KDji/NHOFQ
         X8lqmNRA36W4xS88+IuygRvAtB0aOgPI6R9qK3g4A/7NQqHgdX3OaLlccEFmt8c688b6
         yb+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793075731; x=1793680531;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lvPUnqN8PL1OAu56QIuIdIBU70pIUAL/ta7uRi0Zh7A=;
        b=CMA26ejlFags43rTXDWByJR0UaZb25yrcAy8+FC69t68KDjKYW4G6+wvpc6FZt+N+N
         R/YsVZ3EWYoMDrm3TmUEPDT5+qcqqEq5x3rOFZFKVO+O3/GQ8w1PfzlNC8c7VUaUl6Wk
         lAb0KFKKP0NaEiDPJatjK4quDVUQgDsFkAvehHhxcp8X/ZcNfnwk6TgS2JJ4QoOFmUMZ
         ApRwdVoNUXqQLsCqEQjfkgsc56PHX741tCda91RPn3L84BPzeZqReEbjO18rGtQmSsxt
         w00YWTYYxzlHW+qi/sUmJ5xgbulttFw0PieU12vM4lyi0kK+nF7B8sceQ95LF4Wefzgy
         N8bw==
X-Forwarded-Encrypted: i=1; AKwUvBzcGU1JV+Uc7uo7VU31O0ult6wU5Kv9tHYONd7aIRiMhYNHUJwq23jThHIRTCLf8+TfUF4A5RCzhmhvQA==@lists.linux.dev
X-Gm-Message-State: AFq9FYJxFw06cSyrCaI6j+6m0xMqLqKtQee3MHxwkUOoo8U3rT3+5BpC
	RnHo8Q2HbqBzfxJwK/Tadcywj/vyGRXrH0JotR/QObzzuzmjLHrh6k2z
X-Gm-Gg: AYBFou12OeJB7b1l/JsEYwFLE3VfRrXPWZAoy4xfwMVfprkOWseVkKY0c08xphiFVfq
	ZXnBydisfoD8Tp37cE76FBpWBbikBwU+XTB6WbmXhq8B+4bTvL6Qq3gnnSzXxAvH57BdM+Vvb1q
	PL4L8TXydcxFsSbb0SWb4DvP8/hoomEFxWSKgO0zJ2AkM9LGdUbEG/vXus+ZGlzFq8vy3UVkuVC
	hvDOR6QJQk65j2NrJBcmiNqvVkBzw9DMKj1dyWhIQ8yo0l1gtAeUI0Bzs15tDaroIGNOqy0DSlF
	uUvN9jINPoQzvjKvrUBU8EQ7OZyFjagn9iVUq1X52Dcco0uBBsp8oOyq/0kEOF3YGVQ/HkPskht
	aeN0R++imgQXS1umX6RAhzGnHUrMeHeg/dENHz0ELerqEdJqdmOOE1tsSXpXdoeiXmrI+BWUaqJ
	x+SR0+eusYJQYoum1uxguTaBQsvVaTRADyj7F+8RssM5AC8UniG1MEjJ4YkjWbH1ZWNXWwcvFoU
	D9ZKLfqaZ3iZCUhGw5LGjFOXxahtBFXOtFyO+R/f9BM1rTrvN9kikBGaSvsw0fLlhPjqFSgoDeE
	U07wyIw6ig4FD2vIh3lbvHOxRzRy3Q1VOJi2YXICt+4xFSXL2ELKf2eDaYzrFXuPIxU70U/mjPt
	ghuc+4lKJrzmkkhJ/GfMHfUJtbTgHsmfj+G7H3HTppeEDLkW4rA+g/OazcCk6g/OdeazxjRhcxS
	AejvDR3PSqNw==
X-Received: by 2002:a05:600c:5307:b0:4a1:c5eb:b445 with SMTP id 5b1f17b1804b1-4a35acc41a6mr147390645e9.35.1793075731463;
        Mon, 26 Oct 2026 21:35:31 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b2ac-9b01-6900-1f92-d182-4435.310.pool.telefonica.de. [2a02:3100:b2ac:9b01:6900:1f92:d182:4435])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a55e99fsm246720855e9.4.2026.10.26.21.35.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 26 Oct 2026 21:35:31 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	io-uring@vger.kernel.org,
	regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [REGRESSION] io_uring: final close can hang on a stopped submitter
Date: Tue, 27 Oct 2026 05:35:21 +0100
Message-Id: <20261027043521.99446-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 13d3783a55b7 ("io_uring: wait for in-flight requests on ring
release") can make the final close of a shared ring wait for task_work
owned by a stopped submitter. The close does not return until that task
resumes.

An LLM helped with the review and reproducer.

#regzbot introduced: 13d3783a55b758a9fa05b67835afa7e216476c61

Last good: v7.3, c03c1a14507dfaf8b856c2608f9ac216021fc222
Tested bad: d135ab453a7400a34930bdda1ef4bdc8acfac80e
            (master as of 2026-10-27)

The reproducer uses a default ring and three processes:

  1. Submitter B creates the ring and submits POLL_ADD on an empty pipe.
  2. B forks closer A. A inherits the ring fd but starts without an
     io_uring task context.
  3. A unmaps the ring but keeps its fd. B drops its fd and mappings,
     then stops itself with SIGSTOP.
  4. After confirming that B is stopped, controller P tells A to close
     the final ring fd.
  5. P resumes B after two seconds so the test can finish.

B keeps both pipe ends open and remains alive until close returns. This
excludes pipe HUP and process exit as completion sources.

Tested with QEMU 11.0.2, arm64 virt/cortex-a57, two vCPUs,
CONFIG_IO_URING=y, and CONFIG_PREEMPT=y:

  v7.3: close returned in 0 ms
  d135ab453a74: close returned after 2005 ms, immediately after B resumed

Regards,
Karl
