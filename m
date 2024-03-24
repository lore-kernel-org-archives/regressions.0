Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E3517582
	for <regressions@lists.linux.dev>; Sun, 24 Mar 2024 10:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711276305; cv=none; b=EVL59QKJxA07Loq0FwWm5Fba0rxx6IjcMonKWu8poY1fUfxtPbTtgVtXtC5kVL/+QOgchkgQNQfM6PjL23ihA5414WJkP8QZWovpDPV1jBWJTIWC+59Oi+Q224ymSxSn0oS4C7f1n3owuBnNIDRaFNPJbTRHuwtvaJj0RFrCNGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711276305; c=relaxed/simple;
	bh=SlUKX+vpE5/tUofA5xnCFLMt/y1YnwkKM0QuVaQkt3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hVc1eLPlhIiBQGkio48uwBx9af3EhqzYAzJ5iG7j1AfZOY5kkRziCdcBZqUlP/k7aZLTlIwXqysPVt3VwnqkgacRdVuQ/1l/ybzZaoRoiglqYtPvI+BjGpTCcRQWjIev+idRpltuVznlHc+JAGRDjW5hajsqY1TWQMMqgXrh+kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WQQCflHP; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WQQCflHP"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-41482aa8237so7008025e9.2
        for <regressions@lists.linux.dev>; Sun, 24 Mar 2024 03:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711276302; x=1711881102; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rQyx9cpHkhk4sWfUXICYh7TCfwztYm/UYhwISHKdM1Q=;
        b=WQQCflHPB1FWKJab+O2PoacuPPh4HSGjnp1FvLoRe9oBCey+vmIkLAWUmvTpngDu6M
         +gqhNwXPVQmspbjMHvgv4F5by7zIGA2uHpDgIQPxkuQf7a70/zyFyLdh9aaqcS+D7bA2
         qpoI0dKy8+VX7qaXOQGcPn639x+5IwgLxdqIYM9VPNBSfz0pAmaPnVDu+opW72ED/SZV
         NMpkM4f1oxwGuSaRW52cG9wS/ZxicXWjgcxv7ZVrruTSKi7VAAyTmSvpsq2l6ncqN6QW
         2WyqZmRJyVE/rz4zL8JjaDlfsF7HJ4ErJ0Zs1IeeNvPlmwPL2ROAaX4M+C89y2gHdaJv
         QRBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711276302; x=1711881102;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rQyx9cpHkhk4sWfUXICYh7TCfwztYm/UYhwISHKdM1Q=;
        b=tDODsZRS307x5iJ9uf60H+fiOLmqZTrGWHdnucHVtxWkZs8GGip0vq2XgV9VXk5TFv
         v0zwVPJhNWx3ii66Ho/YSYmfeGnba/b7zW739H0HLq5oKd5NMMT6U+pi1of/3GiP6TG9
         erL9AQKohZLzeWiXzEcIxOs8JoHWgk99rHLKfRmnErrmxlxJIycsS4Kgu0QFH0ixFgzS
         /JAwI/feMZ/v8rhceqlz3IUOELfn1vm6cXEM0rFlPAJVJ5NmnZq84x9roKCK7MKE4wiy
         QGxbVCLjSYWLY1J19nsP8ApfRC+vkjbSbI8beVQg8FhLxQ4K4qzt3+XmffJyLw67Xo37
         yb9A==
X-Forwarded-Encrypted: i=1; AJvYcCWJjWyD2Uuih/WWCrpvdSiSF8eHZsFV5Kf1LCnKaA/MQ17mjWrAbZQjZzhS82m9G+TshN7DLpyCid+JencuxO3sF1hcG5w3Q8a9jeA=
X-Gm-Message-State: AOJu0YwHqCgmguhYKQsXt0uO9kZ5m/rY2i8gycohLjLRBlmE43ixREHh
	1o24q3ErSyq8ZbYeU9Tmmit1niUOecgKVfnY6+orbrT+W0m5T0y+
X-Google-Smtp-Source: AGHT+IGjLy01aO9r5B3GkKksauwntrKkor9blN2uaDBKNhlfd/tgRSqfW1/ieOqNiBxvigUAZ25tlw==
X-Received: by 2002:a7b:c055:0:b0:414:5cec:a9dd with SMTP id u21-20020a7bc055000000b004145ceca9ddmr3643664wmc.38.1711276302185;
        Sun, 24 Mar 2024 03:31:42 -0700 (PDT)
Received: from gmail.com (195-38-112-2.pool.digikabel.hu. [195.38.112.2])
        by smtp.gmail.com with ESMTPSA id x18-20020adfffd2000000b0034181bea3b0sm6554504wrs.3.2024.03.24.03.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Mar 2024 03:31:41 -0700 (PDT)
Sender: Ingo Molnar <mingo.kernel.org@gmail.com>
Date: Sun, 24 Mar 2024 11:31:39 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Steve Wahl <steve.wahl@hpe.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
	linux-kernel@vger.kernel.org,
	Linux regressions mailing list <regressions@lists.linux.dev>,
	Pavin Joseph <me@pavinjoseph.com>, stable@vger.kernel.org,
	Eric Hagberg <ehagberg@gmail.com>,
	Simon Horman <horms@verge.net.au>,
	Eric Biederman <ebiederm@xmission.com>,
	Dave Young <dyoung@redhat.com>, Sarah Brofeldt <srhb@dbc.dk>,
	Russ Anderson <rja@hpe.com>, Dimitri Sivanich <sivanich@hpe.com>
Subject: Re: [PATCH] x86/mm/ident_map: Use full gbpages in identity maps
 except on UV platform.
Message-ID: <ZgABC1oQ9YJW6Bw3@gmail.com>
References: <20240322162135.3984233-1-steve.wahl@hpe.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240322162135.3984233-1-steve.wahl@hpe.com>


* Steve Wahl <steve.wahl@hpe.com> wrote:

> Some systems have ACPI tables that don't include everything that needs
> to be mapped for a successful kexec.  These systems rely on identity
> maps that include the full gigabyte surrounding any smaller region
> requested for kexec success.  Without this, they fail to kexec and end
> up doing a full firmware reboot.
> 
> So, reduce the use of GB pages only on systems where this is known to
> be necessary (specifically, UV systems).
> 
> Signed-off-by: Steve Wahl <steve.wahl@hpe.com>
> Fixes: d794734c9bbf ("x86/mm/ident_map: Use gbpages only where full GB page should be mapped.")
> Reported-by: Pavin Joseph <me@pavinjoseph.com>

Sigh, why was d794734c9bbf marked for a -stable backport? The commit 
never explains ...

If it's broken, it should be reverted - instead of trying to partially 
revert and then maybe break some other systems.

When there's boot breakage with new patches, we back out the bad patch 
and re-try in 99.9% of the cases.

Thanks,

	Ingo
