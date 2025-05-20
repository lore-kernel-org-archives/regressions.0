Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E891217716
	for <regressions@lists.linux.dev>; Tue, 20 May 2025 22:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747781322; cv=none; b=KzOT7rtYE0R37Txq9Zrb4imAbrJjNmdW4+yM4G0h4+ST44xShDbswQIDCfEULa41gLnecQw9+JPQ5RCMf+YqCHoqJySLr56UyFtNmbBR/ickZLDHaGAfUuAKRK0LjlF9/gVeVhrpsx4N8ea8h2wvOJ+4U40Rmj86POKYQcJL9M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747781322; c=relaxed/simple;
	bh=/2Cb9WY6bPkayYtI4ghDmErFFoZgsljPtztUSgmA8/8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=qor3dWdCw22AtNa0Znc6PANxMk5D6hkmJJzdztkrqSfzPj8u3lmU5Xyvogo1gjsRcZt54GcgnQuKTrTuKX7WqoZ0cYZMVsOjvka9eC/DAu7gbDYhzoblG1vTRH/9MVUK/K/qVpFN7e3d46tlPzaNjVRzGMOj3Gy4ybNE6RYPsGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jwbHTS/I; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jwbHTS/I"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7406c6dd2b1so6029241b3a.0
        for <regressions@lists.linux.dev>; Tue, 20 May 2025 15:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747781320; x=1748386120; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gTck1yGqn34V0Z4W8SweTAUMX+2ktQbzGZD2RnyEFtg=;
        b=jwbHTS/IhE/Eq4xY3MHCkvYXwD6pxOs4lHXkf9WJpHFvAuadxkgCzHib6eSH+xL81H
         UTUBsmraEjQKAAfWTpKUiVu9iBxgAuOVE4mb3sCpyCvbcGNak3aLCipKpQIzLCYRSScq
         ruV4YfZCSpWFs9eJEnec6Wz0osXnCRJRSHNUyTRybRbm7uncgS/A2nkIejw1QRqTyOAG
         vDiPPHrTne6MA15FEuD/eBgFTi7MoY4AKxA7kL4Ycsb0trI0+vlVb1n0CZnvaU8Y50J4
         fLQ3a946/nivk7tNwtmfcWSIlxzevdUKd1Ij4Mzri8diOhGHczPM//DwXACdi0PfB6T7
         E+rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747781320; x=1748386120;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gTck1yGqn34V0Z4W8SweTAUMX+2ktQbzGZD2RnyEFtg=;
        b=j+DjBGuCcMDk+5bX1erCiD81IUimsEOsS2k3M00lUzUbTp3/m/HRbPWDfpd5GvUxsB
         Inh7y9rm+yzyVGYldQVcVo4ZUfZMEd5KGjMA4ONdRsOpYuul3XP3sOLuytMFNjWo/gsh
         1B37/EcM5sb7YQDzQ1EWTfjqkrK59Zv71WUqtOA/aKc9HeiNA+rD0JR8QxMfvmEMDJqw
         Z8+Z8jkIazecuEnx5FuItbga39qOK1WKdiAgjK1zoUjigI5FL8OJVgeYojtJPWoahDXI
         JhGdn06BPcPqE6ZSODe/Z1oQ/T+Vmo/JT5uYhpWzPA1EsH/+i1gdK9NL/PY5qKN50FD6
         FnSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGx0v2XEXVBnqySD+8bz0XLPRbV3kPIDi4IDo/H5WIWtCQIfTNLLd7Y6ekUYkYLEKQ0JAmz3amG1RStw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzUslnUpLW0m1UUntVBsYN6xmJhDOUa+VxtGqm1nSoA4arv2dR2
	xLTWZuTGGa8PS+ye5whkgS/PvDX4PIXopTlHVwuYQRQ2xBejkx4k7MX4
X-Gm-Gg: ASbGncu51nP7jZ7bi8r+UFD7h2q/tY4D1EfvR6E5+3qYDBFYmLxM9zc2MWT6cVh1uDX
	mt6fsvwWJIl2vKWyisIT+nf2xVAuHW8sYQmHpRf8TBXda0IuVMCT7NBfMAmWzax2aY0Azynf+7p
	jfs4RuUFQNLTV/n6Qv7qjeo7xvu7bVQ++aQCORTeNqWGekKFGbWglrZCsrYDEk8psjtjdzHtxqq
	GnjLc6FRMEcu69WALg1PrVPbThI0EEwhm+EP2/EPYuHKb8pVmXoBZZ/BT5GWbcwdE90MPUeNRy7
	j0ou2OLE9ngEFc2hs46hDk+NILv5txX11brbSfVxXf+SsuF35oco
X-Google-Smtp-Source: AGHT+IG2X0pomsnFUCQa19hCElWt5qNsJlHFQAhMvQ4eYIPhael32C2ELAIMHyvCUOkhzqa8EkvDjA==
X-Received: by 2002:a05:6a21:3942:b0:1f5:8cf7:de4b with SMTP id adf61e73a8af0-2165f84b77fmr28235687637.16.1747781319816;
        Tue, 20 May 2025 15:48:39 -0700 (PDT)
Received: from [127.0.1.1] ([2601:644:8500:5dd0:565f:91c6:a34c:f6d2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a970c86asm8739999b3a.57.2025.05.20.15.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 15:48:39 -0700 (PDT)
From: Rudraksha Gupta <guptarud@gmail.com>
Date: Tue, 20 May 2025 15:48:37 -0700
Subject: [PATCH] arm: Fix rustgcc unknown argument '-mno-fdpic'
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-rust-mno-fdpic-arm-fix-v1-1-44e77fe6b2a1@gmail.com>
X-B4-Tracking: v=1; b=H4sIAMQGLWgC/x2MQQqAIBAAvxJ7bsEsofpKdLBaaw9arBVB+Pek4
 wzMvBBJmCL0xQtCN0feQ4aqLGDebFgJeckMWmmjjFYoVzzRhx3dcvCMVjw6frBrlDXt5LqmriH
 Hh1DW/3gYU/oAqSl0WGgAAAA=
X-Change-ID: 20250520-rust-mno-fdpic-arm-fix-940a58bf9433
To: torvalds@linux-foundation.org
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Ben Wolsieffer <ben.wolsieffer@hefring.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Naresh Kamboju <naresh.kamboju@linaro.org>, 
 Christian Schrrefl <chrisi.schrefl@gmail.com>, 
 Russell King <rmk+kernel@armlinux.org.uk>, 
 Rudraksha Gupta <guptarud@gmail.com>, Ard Biesheuvel <ardb@kernel.org>, 
 anders.roxell@linaro.org, arnd@arndb.de, dan.carpenter@linaro.org, 
 laura.nao@collabora.com, lkft-triage@lists.linaro.org, 
 regressions@lists.linux.dev, Nick Clifton <nickc@redhat.com>, 
 Richard Earnshaw <richard.earnshaw@arm.com>, 
 Ramana Radhakrishnan <ramanara@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Linux Kernel Functional Testing <lkft@linaro.org>
X-Mailer: b4 0.15-dev-8865a
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747781317; l=1766;
 i=guptarud@gmail.com; s=20250208; h=from:subject:message-id;
 bh=/2Cb9WY6bPkayYtI4ghDmErFFoZgsljPtztUSgmA8/8=;
 b=dD0YMCC8TsOC7IFCio+JlJzS+fFX1g0IwQRGhA9s2diSjuMpAGIPX3Ee2hG9VahQMcIbrK2cl
 bN54N5hVbo7AGgCE/g84rx9JmJkY+x9eoHA3sVDBMeJ7VKlSVi2Ujca
X-Developer-Key: i=guptarud@gmail.com; a=ed25519;
 pk=5lJNaiR/Bu7edToWFLriO5zXOrVqSQWrBKbAKwuEw04=

Currently rust on arm fails to compile due to '-mno-fdpic'. This flag
disables a GCC feature that we don't want for kernel builds, so let's
skip it.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
Closes: https://lore.kernel.org/all/CA+G9fYvOanQBYXKSg7C6EU30k8sTRC0JRPJXYu7wWK51w38QUQ@mail.gmail.com/

Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Tested-by: Naresh Kamboju <naresh.kamboju@linaro.org>
Signed-off-by: Naresh Kamboju <naresh.kamboju@linaro.org>

Tested-by: Rudraksha Gupta <guptarud@gmail.com>
Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
---
Currently rust on arm fails to compile due to '-mno-fdpic'. This flag
disables a GCC feature that we don't want for kernel builds, so let's
skip it.

It seems like this bug went through the cracks, so I went ahead and sent
it. Hopefully nobody minds.

Closes: https://lore.kernel.org/all/CA+G9fYvOanQBYXKSg7C6EU30k8sTRC0JRPJXYu7wWK51w38QUQ@mail.gmail.com/
---
 rust/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/Makefile b/rust/Makefile
index 3aca903a7d08..f207ba0ed466 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -273,7 +273,7 @@ bindgen_skip_c_flags := -mno-fp-ret-in-387 -mpreferred-stack-boundary=% \
 	-fzero-call-used-regs=% -fno-stack-clash-protection \
 	-fno-inline-functions-called-once -fsanitize=bounds-strict \
 	-fstrict-flex-arrays=% -fmin-function-alignment=% \
-	-fzero-init-padding-bits=% \
+	-fzero-init-padding-bits=% -mno-fdpic \
 	--param=% --param asan-%
 
 # Derived from `scripts/Makefile.clang`.

---
base-commit: a5806cd506af5a7c19bcd596e4708b5c464bfd21
change-id: 20250520-rust-mno-fdpic-arm-fix-940a58bf9433

Best regards,
-- 
Rudraksha Gupta <guptarud@gmail.com>

