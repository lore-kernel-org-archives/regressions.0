Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85FE2494D8
	for <regressions@lists.linux.dev>; Thu,  9 Oct 2025 12:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760014192; cv=none; b=kFZtgq6Wt0BO6wTk+FitwcGdqW1CU7ciSPAKX5b9uBXQnItIXssMDlS9XcgPAckZZ+b9Xy7XIME83+1DEgKTik28zUDhHueEXzeZ3WdYptmMeX47Iei8MX95/D2mIPNxkbo78Mvg/Rj2IrXfRdU80CcatMKSGpiid9PMlCRh4JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760014192; c=relaxed/simple;
	bh=VfKKewdOhmPX5s/YjhmEHDiOah7+h6ANqVNbRICAosI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ub2Vs5D1YjgQcsp4J68qoB9YdklSyl7p60I/Lbvkt2WaxnVqzusk67X7Dh0SJIV1r8QBPDp1ONuAbX/O6TYzzNeOzhYSWJ00AE+BmCfJxn3CxvC9iZnwmmrJGaglLNy+jxobbBbLfNNg1suafxcM0yQaL5pB4wsjtVYqKcZpYOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mTZFGgbq; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mTZFGgbq"
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-5a2b3bb803bso545215137.0
        for <regressions@lists.linux.dev>; Thu, 09 Oct 2025 05:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760014190; x=1760618990; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VfKKewdOhmPX5s/YjhmEHDiOah7+h6ANqVNbRICAosI=;
        b=mTZFGgbqIe8JbCbLO1+WcFBWgV97XC7v2vzg/4uOhG66kBdf+UzacukwkVbiOcE/tH
         eH9wM+SWwHXXnau6DXlpsZo/HdiwFNtiKuo20RsFCv3NNKhJevuCz3Mp+1nmFDio4BVS
         B1C/c245xSW3dKMcDx8pj3ZbrQ0BFaXYMkT81ybBHvNj3tlZxvyJ+gG9uvJlLAGY33nJ
         UEDOXKixyoXY3PVtM7vrA9iAMUFUKBXWvMIao+4nsKctauGdsJ0OkIScporVmKqNPgdq
         iP6YnjaDz69n5pcVDU3zukP2SBoP3LLIrEaYGzvN4d26x5gbRM7+WAlXMlRRbOhqGtiD
         fyVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760014190; x=1760618990;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VfKKewdOhmPX5s/YjhmEHDiOah7+h6ANqVNbRICAosI=;
        b=hAr2UZcsEpwVsBS9NON8XyXgEVi7AzmTIP4T3WPHkpRyt88P1EETGeKMIe0HJNz9zw
         IYvGgWNAak8PkIOd5xgmAFaq/ItYxRevZrVGPVB3EElqTkQ1kWlhwvfKhaqYgT4u5G2U
         y91l+JfXDD84fB2hGjTMKdNKUTYQzZMmNd2N+29GPrix+mOVoq1PboEPqovxSm8EALGC
         SdMEgMpPcuFa59ItLR7NZTTO4ulEecIMCbV5qJ479J0ITqLidBfH81B6KuoU/ttkFF4u
         yvJp0RBPzFKIRFEAJQ1CHSCw4pQJfAZbWZD99+4fJyk7tn1av0rba46qOpCgJ5VnIjBN
         /vJA==
X-Forwarded-Encrypted: i=1; AJvYcCUqHjCpNX+TKLmjZnrIQ5YN8PVjnfKzs80MqnmrESq3k7BUJWqRhsZX58sZXCFNGyH31c79fMPg0GXASw==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywr9DJIDxUGK0zRh+hNnDEyA+Ig/vDphppjp0ebsDlUiq3blI6d
	7Eu2BUo4/0/47l5Em3NX5knKVnAuiTelXhrHo4QegwEkASQ52VhIxApHBi+Mspwkc+g8HXzP5vO
	GC3Dju6vkewzSp0veuj4c7s6V6khpAL0=
X-Gm-Gg: ASbGncuMRiwmHTXPo/2/SCueRvRrfo77Wtm2bSv6kT+wrekbmGA8moVfrMc72sgy2E6
	KKWGi+YXcevrMWF5vEet8KkN4rnvRslkJYGIzSSfNPudHO3jwnPhJKnq1sAu671WQ7Q8pdKuf+N
	4OoagyXqCHvpSTocNCf+3WfJzFUTfY1mUbIILR8q/r4YuTwDXpvKM9zfy7XMEGrmh+VGjuwdv8T
	9w8yd4qlnqt8Tvm/eqIMUlXWhBl/5E=
X-Google-Smtp-Source: AGHT+IHtfbVNmua8MslhsQYc9gs8tcKd+k+54POc/Qilqx84xvVx6iDIRusKs9Xd1V+V5i4ALhTvYlM34De+UICHVGo=
X-Received: by 2002:a05:6102:32c6:b0:5a4:69bc:a9e with SMTP id
 ada2fe7eead31-5d5e2347589mr3230736137.22.1760014189789; Thu, 09 Oct 2025
 05:49:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CABpa4MA9unucCoKtSdzJyOLjHNVy+Cwgz5AnAxPkKw6vuox1Nw@mail.gmail.com>
 <20251007231709.6c16802e.michal.pecio@gmail.com> <CABpa4MCUnLUR_0Vzgd=rTr0+Hot=nxHirKrX6xtJWowDoLhWJw@mail.gmail.com>
 <CABpa4MCg7yixe7O8Pp+YwvpxeC=1JPhMhAap12RjtV6pcxFYgQ@mail.gmail.com>
 <20251008082055.5646dadc.michal.pecio@gmail.com> <CABpa4MCm8hQXvtSYqUA+Dh3rCLVM5rTC1p+FsgmFemv+Vyz=RA@mail.gmail.com>
 <20251008130532.49922d58.michal.pecio@gmail.com> <CABpa4MAsvK68CyQ7bVdie1j2m2O2YAEuFJHq8D-65uFT3FzKzQ@mail.gmail.com>
 <20251008223406.13f16f19.michal.pecio@gmail.com> <CABpa4MBGW=OJi+j34TbL2g=zyTg7-rxqpHYfAW-1DXTPk=g5Fw@mail.gmail.com>
 <CABpa4MBDvgJcgJf3_E7k1dBXs7v1tW-79dmc_sQDVM1bES5YDQ@mail.gmail.com>
 <20251009131444.2c221922.michal.pecio@gmail.com> <CABpa4MC-pij0Fczh-mH3zc+Ey2ALX70OfxX=cG4om7R6WMdRBg@mail.gmail.com>
 <20251009142911.6069c164.michal.pecio@gmail.com>
In-Reply-To: <20251009142911.6069c164.michal.pecio@gmail.com>
From: Arisa Snowbell <arisa.snowbell@gmail.com>
Date: Thu, 9 Oct 2025 14:49:37 +0200
X-Gm-Features: AS18NWArSZlpThbhGI6Jq97ozGUANkdAjEtN9Tl8kpJdrzbn2E-s6HZq7QQcWtg
Message-ID: <CABpa4MBAikj508aofG3fodycbriCMYHTZjJm8L5dcEV+JB15xg@mail.gmail.com>
Subject: Re: [PATCH] usb: xhci-pci: Fix USB2-only root hub registration
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, 
	regressions@lists.linux.dev, Niklas Neronin <niklas.neronin@linux.intel.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

This also works, thank you

- Arisa
