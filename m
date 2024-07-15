Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2134D8A3
	for <regressions@lists.linux.dev>; Mon, 15 Jul 2024 21:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721080281; cv=none; b=rJcnHrJqexPxkfg0Q2eVsskNTk01NjGJ2u8oSGv+kVL+XoC618/k+Podxjk64D+8k8sFUgxMkryKsuBvzoHhqXLzNAX+uKPpiuT4sAs7TQSRD5xVMMFX6uyPPuNDGRZ9eyrWb1TwRCDw49hbx/uAEW955Z3yqTIqZo3iUZMm5Lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721080281; c=relaxed/simple;
	bh=PuGKTD0bqaCNqwyH7ywYKEHXZHJXYd40xsrP5Ml+05Q=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=PKfPSVsLpd+WMCRSMdy8uEV4yiIDcL8ScfiCQEWHgXvsz80Tn6h84rjy/KajRtpyr1JQuzOOKvHa9BHaexcgKMA4L/shTNOs46QNVxsz3GeGOdQ6R6n5wsWbPps9xYmeAKHicUH0r31B4Oei1vLXJCFQUrJjuKMW2yjtupZUCpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GGZ15GSr; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GGZ15GSr"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2c96187b3d1so3070896a91.3
        for <regressions@lists.linux.dev>; Mon, 15 Jul 2024 14:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721080279; x=1721685079; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PuGKTD0bqaCNqwyH7ywYKEHXZHJXYd40xsrP5Ml+05Q=;
        b=GGZ15GSrEEOCjv+TKh1UEeAFcNZRGHPenxHm8NQrkiLE0Fn5PfqIsjsIaEKeN101yl
         z0O45UwFgDuPl/utYbdOmueV9mC1vc3puwk4KQkSnLxNKRTs22+RtmTvubA/M3gjg8jR
         eIkyYwRPvTgNBYFp8VeUpWbdjDLRnUTuGR9xwQkTKWKAIPrPy+VVexVv8uYBOAlOvKqI
         ab/+fvZS55I4+Hl41aGkYcGwDWZEqeIOuiwCKX27gIbIAMov/XekhcPEnNh3HlXMRMj0
         TQ/a8k+Z1sGu4MwM7rxOeomUv9BrjzkmcnC80pJXDGzjftWvZxU6kVkO62vfnL1cdE+3
         aDWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721080279; x=1721685079;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PuGKTD0bqaCNqwyH7ywYKEHXZHJXYd40xsrP5Ml+05Q=;
        b=DHR2Zc0msLoZN8UuOteivW5tWBVBgSrCrpCSkSilgZ+n0RpY3IRUclC4czGNmP6pm7
         skILLYQH/HthIYRRC7f+sN4SfMt0sOZ4eg6NRpqsV1puch/KVhLq37IK868X98mdSTzp
         UAyOSqaFIdCAQbXAPr5SBK3Bb2/FMhR0zMRuKqwXSGz2HNb7qWxQgg0k44Q9EaLVpyIF
         elnGZpdT44ZS4H16srIwiWA9UUdPmyN4rT9ZZGzR1bkG1VPYHg2UJTRFiL2qPiS9YScO
         ec/vkGtaW4UAx7OhN/toDreTXdGxP0aPPn93hvGy1bUpc5zp806cNsF+RLCkDNUfIUij
         BF5g==
X-Forwarded-Encrypted: i=1; AJvYcCUJ+4/a1cp2JtGLnk5TdE5HH+ofE+swZnKCGN3RQnTJSsrcLTZMsqXqU8IDpkBJBkMgy0rZVohBIpjmdrVHEUnwnNvszHLzl89mVCA=
X-Gm-Message-State: AOJu0YzhazHv6VzS4zYDb1IICfrvi1yjhyKN736y3G2XVilCAF3OPvjp
	wyj9v0zNkWuITc0bdHFZkORZnJHPEefyJO5iqqMJUGVPZzoKbDX3u2fgLoWaNh7UnvrTJ9zfoL3
	T8fbJP4/g2obi7iIgJ8krDGpLAQU=
X-Google-Smtp-Source: AGHT+IGKempCiAskwViSue/XBabZPqnFmIGVUdyk4bjoTTfM7S8Q5yIcJXA2vohFOfDFgS8ldPk+PEdLN15SvUftZxw=
X-Received: by 2002:a17:90a:4885:b0:2c9:8b33:3195 with SMTP id
 98e67ed59e1d1-2cb373e4291mr145700a91.4.1721080279485; Mon, 15 Jul 2024
 14:51:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Robby Knipp <knipp30@gmail.com>
Date: Mon, 15 Jul 2024 17:51:08 -0400
Message-ID: <CABSVwinoDALdCFk5cB2bg7Zs8uOKkFZnJB4svEXcbMz4Dw1LCw@mail.gmail.com>
Subject: Re: Xinput Controllers No Longer Working
To: regressions@leemhuis.info
Cc: dmitry.torokhov@gmail.com, Edward Wawrzynski <ewawrzynski16@gmail.com>, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi again! I likely will accidentally top-post this, and I am sorry for doing so!

However, my BZ was answered with what looks to be the fix:
~~~
That module is in the kernel-modules-extra package:

rpm -ql kernel-modules-extra-6.9.7-200.fc40.x86_64 | grep xpad
/lib/modules/6.9.7-200.fc40.x86_64/extra/drivers/input/joystick/psxpad-spi.ko.xz
/lib/modules/6.9.7-200.fc40.x86_64/extra/drivers/input/joystick/xpad.ko.xz
~~~

I installed the package above, and my controller now works as expected.
