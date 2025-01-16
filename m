Received: from d.mail.sonic.net (d.mail.sonic.net [64.142.111.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F421527B4;
	Thu, 16 Jan 2025 20:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.142.111.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737057701; cv=none; b=maeKET2gfMxP8XTApEttHrcEy4Jtp/ss1YZcCPXJkRUFtoIGm+sS0cuwtm73ePTytoZ1VxlG2+AYh3a6K6ZWU1ULLGJtbMPLKWfsBrIuYJmbq2f11TCJw2nGhdAqePbEx/lLhPF1RbB9M/3X8maVELIoR9cKfRMLRID6lwSOUVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737057701; c=relaxed/simple;
	bh=P8VTmICgkNUPJ3+q68t8y8420CWCSUaci3F6AVcntP8=;
	h=From:To:Cc:Subject:Date:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type; b=gjiR9TLL7mThHwdWNQvVBo795VqhGc5o9I6funARtlXQPDoD9+C5YOX2rdNMKaRgewz53jvHDzXMGrWKgvvSUDTliajaEDzK0dCAHPJVQ0mr/wyw+/6A3r9h8KQg2az18kHnqk+5tS6HrWDqjXYx3bw6e24aPNFWKzLLJehYBTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nom.one; spf=pass smtp.mailfrom=nom.one; arc=none smtp.client-ip=64.142.111.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nom.one
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nom.one
Received: from 192-184-190-50.static.sonic.net (192-184-190-50.static.sonic.net [192.184.190.50])
	(authenticated bits=0)
	by d.mail.sonic.net (8.16.1/8.16.1) with ESMTPA id 50GK1Vff005280;
	Thu, 16 Jan 2025 12:01:31 -0800
From: Forest <forestix@nom.one>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        linux-usb@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [PATCH] USB: Add LPM quirk for sony xperia xz1 compact
Date: Thu, 16 Jan 2025 12:01:31 -0800
Message-ID: <isoiojtsus9u1ceg97eqtj7hfi9e7qecmv@sonic.net>
References: <10kgojpeckdq0pb4d95k1prma49du5itre@sonic.net> <2025011608-shady-recite-62f6@gregkh>
In-Reply-To: <2025011608-shady-recite-62f6@gregkh>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Sonic-CAuth: UmFuZG9tSVaaVLEYnIGcyMUQ8FY/N84AHi66nt/kiagPRcfFz/7Sdw94+KSqu2nz7cyezlfdrfmM11vtiBvd2ogTVz9NEy/+
X-Sonic-ID: C;FEEGrkTU7xGTN4Gchs+snA== M;2iUfrkTU7xGTN4Gchs+snA==
X-Spam-Flag: No
X-Sonic-Spam-Details: 0.0/5.0 by cerberusd

On Thu, 16 Jan 2025 11:10:50 +0100, Greg KH wrote:

>> Signed-off-by: Forest <forestix@nom.one>
>> ---
>>  drivers/usb/core/quirks.c | 3 +++
>>  1 file changed, 3 insertions(+)
>
>Always use scripts/get_maintainer.pl to get the correct people to cc:

Okay. I'm not sure how to correct this. Should I submit a v2 patch,
even though the code hasn't changed?

>Also, we need a "real" name here, sorry.

Forest is my real name.
