Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E9E289811
	for <regressions@lists.linux.dev>; Tue, 22 Jul 2025 11:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753183408; cv=none; b=rl9WwaOH8yS8y107qH92QUaYpjnb29N3AB41o1vikDQzEqGcg75dNyY8Xf0fh0voVfof+IEYrPRqD4xmg0o45kxnZTwiVusRkUqx3sE3735lI1HErxaX6O0fukAZTdIRzJysYp78aPDmwtpU8zI/BtOBzbk1tZ+Xd/9PTnt4vuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753183408; c=relaxed/simple;
	bh=RLZzGvv0fQvrHgNWi5MsZ17U0rjJzPXea+WLq40MRPU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TUzDl2BFsTnjftm/Qk4Gj9zjXEI6TjgB7Rjk476N7RcWUHjoys4gbqE6vJ0HwMcW50Jf3WZ72R7KRAtvYS9f0uKbW97C4DHzQj4hGDRIiRIM3sfFTGAus1TUUCPwwCOp5l1gYwKy0RHr6fjaTJ3nRAHW03IJLOr84xCX6ozbaLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZPb63em2; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZPb63em2"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a51481a598so2855116f8f.3
        for <regressions@lists.linux.dev>; Tue, 22 Jul 2025 04:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753183405; x=1753788205; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AW3XO8zEZYz1xD0qqvNEDPED5BeRO4482LcQqtM9mSA=;
        b=ZPb63em2YDENq98jZZ+UbfEckZl3E1MvxYTifbI6IXDvIOg7AlJt/2fQMsdYOUM/gm
         to0rONhJNdqvIQKsNmlXOnuMmy3YGCEhZVxBH59FuK6tM2xgXrTwXOKvDIZGyFX+CpM+
         U2CoCVlgBip2Ko/1r0lKE/9QTyjYllzeuXLQQaBzoA2sioU9Oto39NTyuzDK6skjg4tS
         k8RbYSru41YQFPGC7YsYadzLt+MePphqweB5DKZ3nHRRfg2bZXfEz1l4gOFtz0YNoqTY
         p6/C0R7GNtDyUeGCoKu87653V1NG8+h3l3KNVYc2hQBE6COsJSO1GHLUbSyJnvXF84DK
         +wiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753183405; x=1753788205;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AW3XO8zEZYz1xD0qqvNEDPED5BeRO4482LcQqtM9mSA=;
        b=ocS5eZPhpMGcNFBsDubqN0RL3dUR+qn6oFd0IuS+mw8fU78bV4I3mpuPa0JCHqYvag
         JzAoJ9qR+dm94/oJtdxJXHrDdT9cgG/spooWWlhN4VndyquwgRpFki1A1p/oLKlj7lDZ
         ZIE1+DMckSmp0yRmS+A/BFFnwY6e7gwEdI7zqprz/JWKxikvGRPaDQeihRogTcrjl0s6
         B9K2Y+ST/pZ7OOlmbrk6OdPiaqK/SEFkO7Z4kkyLsfOuGVixHUypmam2oHBlPAIvdzx9
         CkQXIqLf0OR+xoyMRZtLSrNO3VwUtPm5VIOfuCoIDntlhERzyHHA9hW1CcKmx62zyl90
         RzGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhoz78qRicfJE1vlToDbjlZ1vaKT01upLxAIyq9TDncz3LwkT5a1COrtHTXFgBBTvn+hy1qJKWJUDyyQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YweW1UUrZIxNIKFxx66f17JkIwSlG+UuGgvpEaAvHaXj8ErLFMl
	Spbg1azWtj5ybWNJt7twT8s5abA0D1M5NeQP+RXQbt+OG0euFq96LxrA
X-Gm-Gg: ASbGnctZNGW2c5AFaHlW8zhwb9QBSuLdMDt+pZlj/I0YaUH9qUE7q0pnzxmY6lo3sd/
	S/NOiv6bO7yPU9LxsZ7gyqifjFwFsMnzCEAiTWDfbNb5gJtaX+mQmmVfZU8fAEeiPxD3QY+KeWd
	RgqCLtoeVU85TVi0GebwYAM8yNUS0Ny7yXpG4hb+YuTbbNK2i4t4DH7rgDPgzSSHhdkqMsmzB3Z
	HOuY2jh72mi7N+2O1B3yb1ENip/d+guo0AKYmyFUWmStqGzDME8x0buO4Ies1xxX/ZlWoFv1abo
	j6aeERDm6i9b115zGbh7KG1RLAwNHi3mz+7kn39XPjKST4Bo6Bs0ORvc3FTG8y2iGOMBHHJXpzu
	bejNCU0ZW+wfJflDmMAh5h5pOXW6v/6U=
X-Google-Smtp-Source: AGHT+IEfDiD9I2pNF0jXJ/cSaeYSBpm9oX9sVP4lvivTI5awLgFLeYjfeutIkqKpvFemvrkgk5+rmQ==
X-Received: by 2002:a05:6000:144b:b0:3b5:dfc2:f0ca with SMTP id ffacd0b85a97d-3b60e53ea17mr19047283f8f.40.1753183404824;
        Tue, 22 Jul 2025 04:23:24 -0700 (PDT)
Received: from debian.local ([81.78.104.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca2b803sm12825212f8f.19.2025.07.22.04.23.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 04:23:24 -0700 (PDT)
Date: Tue, 22 Jul 2025 12:23:22 +0100
From: Chris Bainbridge <chris.bainbridge@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"kvalo@kernel.org" <kvalo@kernel.org>,
	"Korenblit, Miriam Rachel" <miriam.rachel.korenblit@intel.com>,
	"Berg, Johannes" <johannes.berg@intel.com>,
	"benjamin@sipsolutions.net" <benjamin@sipsolutions.net>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: Re: [REGRESSION] iwlwifi: suspend failure, bisected
Message-ID: <aH90qhWMlUF2sgZi@debian.local>
References: <aDsNn70jcX6sDLLT@debian.local>
 <20250716185057.GA2548435@bhelgaas>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716185057.GA2548435@bhelgaas>

On Wed, Jul 16, 2025 at 01:50:57PM -0500, Bjorn Helgaas wrote:
> On Sat, May 31, 2025 at 03:09:35PM +0100, Chris Bainbridge wrote:
> > Hi,
> > 
> > There is a recently introduced iwlwifi regression on suspend. It appears
> > the bisected commit was only supposed to fix a warning, but reverting
> > the commit (with a small change for revert conflict) does fix the error.
> > 
> > 7438843df8cf7a484303caee7540a00f0ef972b2 is the first bad commit
> > Gustavo A. R. Silva <gustavoars@kernel.org>commit 7438843df8cf7a484303caee7540a00f0ef972b2
> > Author: Gustavo A. R. Silva <gustavoars@kernel.org>
> > Date:   Wed Mar 26 18:04:02 2025 -0600
> > 
> >     wifi: iwlwifi: mvm: Avoid -Wflex-array-member-not-at-end warning
> 
> https://git.kernel.org/linus/264c844abb29 ("wifi: iwlwifi: mvm: fix
> assert on suspend") appeared in v6.16-rc1 and includes a Fixes: tag
> for 7438843df8cf.
> 
> 264c844abb29 is not exactly the same as the patch Miri posted at
> https://lore.kernel.org/r/DM3PPF63A6024A9ECC64ACBA27CCABBAB0FA360A@DM3PPF63A6024A9.namprd11.prod.outlook.com,
> but maybe it still fixes this regression?
> 
> If so, can somebody send the appropriate regzbot fix command to remove
> this regression from the tracker
> (https://linux-regtracking.leemhuis.info/regzbot/mainline/)?
> 
> (See https://linux-regtracking.leemhuis.info/about/#tldr)
> 
> I feel like I might be missing something because there are several
> regressions in the tracker that *look* like they should have been
> resolved months ago.
> 
> Bjorn

#regzbot fix: 264c844abb29
