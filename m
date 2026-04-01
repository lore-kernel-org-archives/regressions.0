Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C28536922D
	for <regressions@lists.linux.dev>; Wed,  1 Apr 2026 15:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775059146; cv=none; b=gPFVH1KaNxQj1P3aT7YTmRNexcEG9Twuho6scNc9SmfU+Bfsw6iwHR9mYFrkRtSNQF7Yv1OtuG8pIdbuUuXWVVKu30Vo1aIRXBhUr3NppgbJ0ykQjzmZz7FXFb5mPfc2uLqkuyjYOiZ1T54vVdSDNOF8qkp3aC3So/4nhkMFcAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775059146; c=relaxed/simple;
	bh=g0hj93VK+MnV0TZ8GYpJD9pLiE8OdenETybIQ9op6mU=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=oloZZS/PA0Nj7rKT4t1ZclRbMzkeBBKZWqKHttffiQ75zc+V2tAhiQAlG4iz912bKlMtS7XoXAAHngEQdtrib19RdNqqdRHCpqWe44aUNOlhFzd3G4iVslE1PdJaycnvVXCjtWUCp0Rir+gO7xCfguXXSI6Kv+vNKRLaB5fg5Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=fSh2Utq+; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="fSh2Utq+"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-12a71ade78cso8484131c88.0
        for <regressions@lists.linux.dev>; Wed, 01 Apr 2026 08:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1775059144; x=1775663944; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ajw3IKfOVWfBkJSl8Xs7tiCj2DKybYXRkWcMRc0BG20=;
        b=fSh2Utq+dllwdUX8whSOjyiyHmuACRrc2Dc8fyayASlfuqi5O4Duqw/s8nXLbXJNFx
         XJQ3OE0WrsnzhaMAG8sdKJG1mz2ui0856NqM0TAQnmInt4HFmRd/Tn52DzFJojmpNBFn
         Xj/IFzXZqT9Hs/gqBu/8JVVsCa/QfJknRv5VFpliqaF9eef78Pndllc4hr195x9kqpM0
         JlyVC71ziytxP3Au2BGFqdIdZWop9VvxAxh4gVK4Ki7R3x/dvnTI0JPJv2ODkZKpH57/
         DKWdJ+YYTAEzZVXSpEBDTloz71DuHRsuR9GOF0ROR3yt9mxFuOHq+1TCM5abSIlc5iht
         UyAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775059144; x=1775663944;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ajw3IKfOVWfBkJSl8Xs7tiCj2DKybYXRkWcMRc0BG20=;
        b=I6RRjSnCtw30qO1Cq7OPdwVXABamo5sQ9kaZ4tJhWzNbWINUPrA57iFtVRVJ4G5ecE
         UOGd6K9amOpBtG1g7cEh+pE8LeuClFs1n796Y+TXDqH+PrH6GqXv4Yysf1F2YILvPV4e
         HOMavHscvq1KfsGlgLxoxdd7oc+aOV8OeasSXWtZRruVzrizFzlRtC8K7rXIRRswgqzP
         q+BzUpPSE3kVTmM5+16huro9Kgr3oepLYslzp3zReuZrX+m+WofGKXWpetbUufK5oTDy
         e6Onm10W98V1VjKjnUNt9xTFrrsYLWMOqGOUx0/Cm4Hgwa6TLSX/p2cQKVaacP7eT+45
         GOBw==
X-Gm-Message-State: AOJu0YwZt+VOivz4EiX0TbMuqdAg51EixBjGZX0BOchwZiNNemIDzYpg
	6ixUo8wkOl/JeV0mgX7mwI7u4vCqGkj7XXtBrYCKARRH9AHGt8M3N8F+tE/kEHKOrjI=
X-Gm-Gg: ATEYQzwxBdNa4qgQ6zqBtzQl8q0xuqXxdLjpbTfnkXZ0sq7PcpE4uZy8+/s5SX2t5Qy
	TH0L3WBTR6vNnGit82V7cUXifjCdCa/6XKw8NQ+a5MQ3GxFT5ZbgMfh2t145ZMtKY/xxxEBeUG5
	2achxMgQs8sXHAOoe5Xfhc6BDMFvAVXOCkVOTydb0ClbuGPzghV9Qi4ri2weAn1X4T5Zjsx9zvU
	a+6ZCwTlTzqfPrwcPaQDDn1pa+8T3DJX7FmhGlngaCpR9VLd7OJEbbuz+Tq2RLsz5TpKNxoem4t
	iVgKl1v9XqPECWbg4BMIsgUyevu3J3acxWVIlmGlHHi+i2iTOC8Du4LlqrZBcjvnG9DDKIKP3Iy
	CFOlrG+cZdJLPz69RSB02tYP0wJmMZI9/LH1AsWMREmh8wegXIE4vqjJPSCEYOjzLdTumYxcOL0
	+94neTum2doaH1N1Fx
X-Received: by 2002:a05:7022:2508:b0:12a:7181:2eff with SMTP id a92af1059eb24-12be645defbmr2220339c88.4.1775059144459;
        Wed, 01 Apr 2026 08:59:04 -0700 (PDT)
Received: from 984b78e0ad75 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bedd70f18sm192081c88.6.2026.04.01.08.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 08:59:03 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] next/master: (build) in
 testcases/fake_sigreturn_bad_size
 (Makefile:31) [logspec:kbuild...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Wed, 01 Apr 2026 15:59:03 -0000
Message-ID: <177505914325.1061.1631140143829045883@984b78e0ad75>





Hello,

New build issue found on next/master:

---
 in testcases/fake_sigreturn_bad_size (Makefile:31) [logspec:kbuild,kbuild.other]
---

- dashboard: https://d.kernelci.org/i/maestro:bd2fe3ab76492e9353ac17daa50a9ba5a205b973
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  bd0f139e5fc11182777b81cefc3893ea508544ec
- tags: next-20260401

Please include the KernelCI tag when submitting a fix:

Reported-by: kernelci.org bot <bot@kernelci.org>


Log excerpt:
=====================================================

=====================================================


# Builds where the incident occurred:

## defconfig+arm64-chromebook+CONFIG_CPU_BIG_ENDIAN=y on (arm64):
- compiler: gcc-14
- config: None
- dashboard: https://d.kernelci.org/build/maestro:69cd3860dcae953c056b53b7


#kernelci issue maestro:bd2fe3ab76492e9353ac17daa50a9ba5a205b973

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
