Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25DF1E2101
	for <regressions@lists.linux.dev>; Wed,  7 Aug 2024 12:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723034091; cv=none; b=dsgq4yQbKS/O0fTRPLbj16+2C++ZdwKfXUX19qlCXnieTJs+TwCuPe2EnY0g/oF2nZTxYr7xc9VsUvcUdY2rkVFb6tlE7nhVsYH/55cyPD4RlVUTsl7Uj2WupgeRKLYPdrun6kF27+4+RJdIEq1DuJT4sN03rnt84sPRKLzPyok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723034091; c=relaxed/simple;
	bh=ys0po9uXAVjZn6YUCwk7hpwywjaBHJTgz/52B8yk1k0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mGuRNpQ+ZBGksO9fdRD+NiKdICyPwhhJGOSbG4eZIWKGr2Q4TKS9fmlTe9xAXUoeHn0JD54uUmLjaPD+1LDzkHs+HEVaFW4AQM10d5uxXXSOtmeI3WJ4wqzKl2563zve64rYz6L2gJtcYeP7px8W7gYUrMVChBJ6dbb6yJIIr0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xbj0NqI9; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xbj0NqI9"
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e0b167da277so1670154276.3
        for <regressions@lists.linux.dev>; Wed, 07 Aug 2024 05:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723034089; x=1723638889; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hHrubDyYul6S/dsbW4ejvPUwj6KN2TaVmFfsX0pIZaY=;
        b=Xbj0NqI9eYwWRIzyMNvxBNFK15dt70KzKOfpGuJb80EViPsKjPodnI/jb7Pm8mo9gs
         3i+r1asiggMrUoDw9mxBddJRP8Y1MCqmEqRDB0uIkiKE94vLCIPnDWI3wsPMOMMWNVXC
         IHxyq3yWGNA524b5RtND1yMYD5Vckb/Qxz90Aw5QJacZQEDcV3QiUp48dBUbFatLrZsB
         QETC/4akIdAgiYzfxmvZiFIVfplVU9UaXXRomotZVvrocWZi9wW0y9EgvRrMy84RlSXh
         RXpPpS6CBu8a43I6gTLOLHsd8zHZ+G3lgjOYW4qipKfYliiJJmUdAUM0HuExpzONOQBC
         jeRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723034089; x=1723638889;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hHrubDyYul6S/dsbW4ejvPUwj6KN2TaVmFfsX0pIZaY=;
        b=iZZfJZG/CmB0OCj1+m0BPRfYd8NecVNT+RHc4PsCFmSOb4+UpdxiVDgdAmPO/pYkls
         /cqYPr/zcGvvQr0bm8N66VxNn30mIB7Ds+AOKywIMABWgBi6mY1XlC5bBww8/vL94G30
         lLgjvjEuC3zxM9t5vxcv65vM33hnqKGxothT3fIXNNRE1lWXZc3Zs6eDTaKG51AP2dcP
         t2BtcHrrBdEAujVR4OoN77OnDj75QxAA6FCDHhhenYtP/8uigBxgh369oa8yhfLs/Mzk
         3/uyBcWM5GhT3xp/bLBzmcUnjc69axVlvXuNpB6to3Z75PezcOBU9ZLArkinZTVIxR7b
         OD0A==
X-Forwarded-Encrypted: i=1; AJvYcCVA52ZJUOUpPxTLLwfZpLx4+tbnRIduQ2OHmDYPwkQeL1I0j2MhqUTSXZ2j6JchjqhdITs/Syz9494yXZV523O+kKHgNrvjckyKrUo=
X-Gm-Message-State: AOJu0YyalW08DFEhUffv/ZxiaWssmV1DR7iaMimpbtpUIJ0q7NdCtAk+
	v0qIns4qmAvpOKvk9AHQqNLgmVJ1AsFgp3+U85Pme2JWmzMxfakOEn8osXR0qP48SuJB99QTwAV
	K4Yr9+jdGnLHWHhxnKxZphoO2UEc=
X-Google-Smtp-Source: AGHT+IFV5gcYHSw6LKIKmZ+grzDs0VgcikAFi0cJT3TV8sVKeJN2xsG+1V0RdKZ/POHFfPmQIdbRSothYtm39RETheM=
X-Received: by 2002:a05:6902:70e:b0:e02:b51f:830f with SMTP id
 3f1490d57ef6-e0bde4caaf5mr24666433276.41.1723034088972; Wed, 07 Aug 2024
 05:34:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZrNRoEbdkxkKFMBi@debian.local> <87le18ile6.fsf@kernel.org>
In-Reply-To: <87le18ile6.fsf@kernel.org>
From: Chris Bainbridge <chris.bainbridge@gmail.com>
Date: Wed, 7 Aug 2024 13:34:38 +0100
Message-ID: <CAP-bSRboZLWg4pzHHrD66NFeKKbsX0z-wUcxJS4OYmzcHXdG1w@mail.gmail.com>
Subject: Re: [REGRESSION] bisected: iwlwifi: use already mapped data when
 TXing an AMSDU
To: Kalle Valo <kvalo@kernel.org>
Cc: linux-wireless@vger.kernel.org, benjamin.berg@intel.com, 
	miriam.rachel.korenblit@intel.com, regressions@lists.linux.dev, 
	johannes@sipsolutions.net
Content-Type: text/plain; charset="UTF-8"

On Wed, 7 Aug 2024 at 13:10, Kalle Valo <kvalo@kernel.org> wrote:
>
> Chris Bainbridge <chris.bainbridge@gmail.com> writes:
>
> > I hit the following bug in 6.11.0-rc2. Reverting the offending commit
> > fixes the issue. This happens immediately when I run `iperf3 -bidir`.
>
> [...]
>
> > [   42.873868] ------------[ cut here ]------------
> > [   42.873989] WARNING: CPU: 1 PID: 529 at drivers/net/wireless/intel/iwlwifi/pcie/tx.c:1836 iwl_pcie_get_sgt_tb_phys (drivers/net/wireless/intel/iwlwifi/pcie/tx.c:1836) iwlwifi
>
> Does the connection still work after the warning?

Not really. It is functional but tx throughput is severely degraded,
iperf shows ~1mbit/sec instead of the usual ~600mbit. Rx throughput
(measured with `iperf -c ... -R`) doesn't seem to be affected.
