Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5112745C
	for <regressions@lists.linux.dev>; Thu, 27 Mar 2025 00:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743037118; cv=none; b=TZ+CG3GfCjuJfvFGC1LFSqdp1NrWvaVWPt6eJrKt6hmQPHgaKbcjLejN1V2hZY9Qi2mMeA1jhFnLmM8SbLOo6+Zsssjiprz3YInYsxMWZgM30LMC185hoA/ifYRzCkMrddkImL6kS/peZqBEn4IJ2gc5R7iYKUQLxLWVwHMkXFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743037118; c=relaxed/simple;
	bh=ajJpnvlctkmr1rqIhEfs8fmWIL+8rSu4llRb/sTa22I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EL7IFGv/SgnJzDGeWOjwKjV3EKHYM46Xrb6rxH86OYnES3RfG3KOKTijDkWNmTzg6H7Quf+v5eYlxgqW29kU5Pqts+Kdp3NLSE0RJd+0t4a67kgxMNoUnNUGvU6evPHEQCk8OktnNLrqHszrMvUYXGEomcfpqt0cf8bS4UdbKCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nZjTDWWz; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nZjTDWWz"
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e694ad3a2b9so63064276.2
        for <regressions@lists.linux.dev>; Wed, 26 Mar 2025 17:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743037116; x=1743641916; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ajJpnvlctkmr1rqIhEfs8fmWIL+8rSu4llRb/sTa22I=;
        b=nZjTDWWzRlbvcUQv2YuGkAH6SvzAa+LjHbwqclPi7kjOjtzhYcxPoFWMKGkVTN+HJh
         pIO/W1FIwYyjB+ITd4A1tCdI4CZvYqBF1T/PYN5j0GZRZyF3dA9wFxqNQdUXAaVhSxtd
         DUZYCqAFQ1f7RP83gjGeHGEfGkZHodnIXu7fJymfS2ZQrs7XSj2jAA/ATDbPpP2WMMUJ
         ssES8JKJ42md1bCXaIFp/pKe//LEz5UBh2zQUCeZSLfLfLrWonZPXm2l+ATt7f5EfbFF
         tpbOa01LXXDn2poDoPAO/dTJrhldpEmxT/XHfUWAVVYOnwf4abYG+hDqcYKIy5jE9Ku2
         k5Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743037116; x=1743641916;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ajJpnvlctkmr1rqIhEfs8fmWIL+8rSu4llRb/sTa22I=;
        b=JXSTxVftuB3wFbcoxs7xJBUNMDIJG7GHn0gVmBXJSw1bwmexKYVITdPPQGYVINNtT6
         IKWPywnjLBmTs+e05xxDPmkUXS9RPMjhqL1CTq7JoLck9I/7aW8hzhUCSvWwpX1yQz9H
         b9d7E9NAnwzXxVwGrJhUymBdcdbNUdYgRaWdKJ/v/mkSfD1pSwVtrouq6PsPmshkAxXx
         KAjGJqriGbxc8qzz0mDBAXrCQfvCP6jMUdS1C0rcyH0BAXrOa42qkhSNleEkcgjeSeNj
         fa/U69dctXP7T2eSPaJrW7vIzD+1YXa9TMegAaTsN7iwGlzZU0T5OFhlw9Xe576AeDJv
         o4Mg==
X-Forwarded-Encrypted: i=1; AJvYcCVW6I+/19xCrlYzSB0vkx2mRrFLnIyOHsT90zZOHD6W6dqRXnKPLlf894h4Cz1zHfFIlHUR+d2IwQn2kQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/+uUIR1ZF/m6KEQDqzmfWXH10IoWIlvTJ5EjkAD/vHbiZp1gp
	13HuZBPJtQt5iJk1kypTgGYWaJdYyiuF4orkGXwWqrcYlUX4DW2MjVNtkbVFRrWCgdaosNX6ht8
	/3eNnudtNNxNLefAjQxDTBBTLWf0=
X-Gm-Gg: ASbGncvPSpF33VU1Bv5iG6FldOi9IEsu7IXM8fnbrGBOgZsr+j6DjT0WURtMmtBCc+y
	732/CmfMD2RHtr7aD9i2PPvg83OWQvxXr43acwbVaSo6Nxwkje0YLw9nC8DbSYxTyOgx6KHaiCb
	IcfH9i2AS6JbJPP2pMOqRtpzRk+vgA3H9iHXZbTZdc0xvf0NFZtammQodnQDM=
X-Google-Smtp-Source: AGHT+IE3zuk37tFvMHRlTuGB9eMhTk6ti9oN5MzAUdhAEetqGOAKpE+yEiAmrz2qvQH9veqgE+2sF99glXX1r8F111E=
X-Received: by 2002:a05:6902:e0f:b0:e60:7d3b:1e18 with SMTP id
 3f1490d57ef6-e694377711dmr2257768276.40.1743037115695; Wed, 26 Mar 2025
 17:58:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAP-bSRbMbZe9LCE15SCbYNTGZjE_xiAm29qzO_WNVjHsJ6oyyg@mail.gmail.com>
 <9ada34661b93fa5dfe3b0c66816a62c1a27f22a3.camel@intel.com>
 <CAP-bSRZm4CyxY1VdtWvZRcfLMwc3njd3OTSd446Q5dcSfjJY=Q@mail.gmail.com>
 <CAP-bSRbon4O=DCLHvOZHm452Svc3-gsZ133Jn7-TFt8f_Y1CFA@mail.gmail.com>
 <36b0f88ff0f17e0246037d5f834ac545afa69cf0.camel@intel.com>
 <CAP-bSRb_f1A=_+A9x8J75socYsKFKDtysZ-m0+6Ks7NdSjQ0-Q@mail.gmail.com>
 <b2674ab2706c2ed81734f2c3d6261511414186bc.camel@intel.com> <Z-SdYIm_lDvmCcO-@debian.local>
In-Reply-To: <Z-SdYIm_lDvmCcO-@debian.local>
From: Chris Bainbridge <chris.bainbridge@gmail.com>
Date: Thu, 27 Mar 2025 00:58:24 +0000
X-Gm-Features: AQ5f1Jq-JpMbTLVMt549o5Y1FwtpkmVt9z4einpWZQEsID5879IMIFH3BN7qVXo
Message-ID: <CAP-bSRYA4sL29+cYE9fF6DHwZPWNA+mpOfMDKTKRpXfsNKUFAg@mail.gmail.com>
Subject: Re: [REGRESSION] iwlwifi resume error, bisected
To: "Grumbach, Emmanuel" <emmanuel.grumbach@intel.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "kvalo@kernel.org" <kvalo@kernel.org>, 
	"Korenblit, Miriam Rachel" <miriam.rachel.korenblit@intel.com>, 
	"Berg, Johannes" <johannes.berg@intel.com>, 
	"benjamin@sipsolutions.net" <benjamin@sipsolutions.net>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Thu, 27 Mar 2025 at 00:35, Chris Bainbridge
<chris.bainbridge@gmail.com> wrote:
> Yes, I still see this in 6.14.0 on every suspend/resume with laptop
> Lenovo Legion 7 16ACHg6.

The error happens with S3 suspend. s2idle appears to be ok.
