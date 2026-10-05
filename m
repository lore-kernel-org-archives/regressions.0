Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com [74.125.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046A33B6354
	for <regressions@lists.linux.dev>; Mon,  5 Oct 2026 20:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791231299; cv=pass; b=PJp1okjCn4wvXqgmfb2Ia0M9FUhxMuQGJn5pin5Ql5NgUTNbGM2GUmPwUH0ml4TpijQiLS/kEr90DHSwBuOUePRvHVsqyZjF0nkInvjm5k0AdWGpUX24Xrx+CpzDGIkbPkV9AcWEPVquOwj/VhFUYUPqZbwOFqVnlouPfDX7xYk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791231299; c=relaxed/simple;
	bh=Bq1UAZX2PNyexZm1nM9MHPN+8GExNYB/82CSsEV7ikM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Dg4CtO12ZWu5i7EUXNbTAykFHK1BWaT+FKCHws4UhL4GNI2F8YD7guMyn2OYLLH/Kom8CgRlCFGhMiJu3OlgxrtCXUoa/9jBN8c62cpgj9ndW07zS7qT6dT/ptTsIteb0LpneI5fJdpV0E2Bh4QM9txGZ3JNVMrrAyiaXK0uatk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p2CLhpZ3; arc=pass smtp.client-ip=74.125.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p2CLhpZ3"
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-32be7127c64so294276eec.2
        for <regressions@lists.linux.dev>; Mon, 05 Oct 2026 13:14:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791231297; cv=none;
        d=google.com; s=arc-20260327;
        b=aW4F7a3suZ7nBSRma47jZORJ35QcckEpSH+gBwUECzM9Har0x1Bggw51M+Mek4XEN5
         F3Rlrrormgl7jCd6fCeVSQiGqigxDWbq1J+lww+3n0ELQC3WA5tU0W3G66agkWBfhhxc
         aaiZhh1ufnUF6z68F7gRfxg4louyykpMG4QX6OBrUD/tohcS6uaN2/fcH40QuEAm37t1
         HGlJZWwNFLc+0qjnDXbhqMUKhtMY7VDuKo3JdkC67uN1ueHFCnSGf6cPaKLO8gNGH7NA
         iFz+IWJKopQ6KynnMYdqskYxUo4tPPx9FyTF0LqmUN9yCOUYO0GtsT2L2pofiq6oQoLD
         6FDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=AMDrs/XT8ZcB40o2W5+io947QcRQ068ng6Mvjz++tqs=;
        fh=t3z07bXpE5dv597OzIs4IK4RMZbiWGP78ly0fqVN1mA=;
        b=LQv7IMo3uvYROwB7dE2gQnRtuc1DHAjg8O8xnDphdVJR6tWCYFWxlKQ8zi2Joph8V8
         7CKtTHfY0auzu2EoWRUiZ0CAvN/BdMgiFAffzkG2JUs5VsTWL4tivJa/COhGhRhFW76w
         cS6o1dQMknXEgcix/ojvTzgecSonEI3LA6IGn1DIwaJGqweynf/l+OnZIIj7VGFWrGcm
         SnaunLjMcitywCVCKPLQ+06JTevU3VOePQRRP6bG0yMn7RIBm6q6HtEF9/E5+rA2SCgt
         TF7xEGLeQAonRLBaMY/af2iz6MdbW6SFtA1uXuBhtgubyM+wH7GbIGq//01JJ2/5WIzI
         txUw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791231297; x=1791836097; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AMDrs/XT8ZcB40o2W5+io947QcRQ068ng6Mvjz++tqs=;
        b=p2CLhpZ32JeuSkeCs3FcN3IlWZ6gJd8c+NfRcRIfnlU5HbsDf8JO2Q9+Tqr27rAnQi
         FH1EiMn8KEFf1en32ogt509ztYJIaDC5NkY04dYPnPX4Htztx1a3YW31t1fM0EIFdcwk
         /UQDuwXRzGr0D2ffrJOM7aC/4u6JIe358PSooZ9UMda8E4swJjXtpT8zOeEJhjpPOnH/
         E9tEMXTWUwXiEvZYwDbHuAqaciJlInXeL3EI1TE7lTc5FtFRNhv3kDdpyZkAqDr9YV2T
         9X4PTU1AyzvWxB6DB0V2jmhgg+U1I2PLcZjPwa8T7iMFhf8AUEsUFSkS9ciL6NcOI7yV
         lS+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791231297; x=1791836097;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AMDrs/XT8ZcB40o2W5+io947QcRQ068ng6Mvjz++tqs=;
        b=f62x3+NbKv8HswH9LV83hndvs9oNvEm4rHXaYnhciJRp/kliD5tWR6VvYTiw6oakXf
         LrBvi2B06UM4B6o3t/HJYB7pny35bVPWIYT9VsGVYXvAFds0uAGS4dyXtIwBuh12Xmi4
         ebs/3ikJHj/S1YhisVZ2BIid1x9VxX+EtHxGgHuhu+jq8BiO5ZEr4TTxYlP5TMc5v3tN
         vMRhL/T9SZSyC6yp9WmuFRa0phrYE+rbU0zE6YFsPjIFqP8taGlnbyWjRKSBc+y8JClc
         A1TfOk4rcub2NyU80LuZZadCqugYfgTLK7S4/R0HnAf1SD8kQvQqjyheVv69dA5cVPBw
         mTfA==
X-Gm-Message-State: AFuF++myg+Bm1tKdXH1gqdGz/6OgxCsVeitt9kX062LMCXzNO5cluMpB
	0vRTRj3LmqPERUthxeCgZqjkcEhw1p6CZiqXGjHgyrd+YYT2NyNtRDZYVyR+NHxC+GCHiGAQX6k
	NvF/pk6IrK0zpAx2IlGAqpQCN38/l4aR1vBFMQMA=
X-Gm-Gg: AYBFou0EH1MsqG/CebAh2fdp5JZnu+EjKy4a07vVdTm9Rg9ILwRvDGYghwABWIWusn/
	0Yd9QEK2tZpWdzqwooHrfsgpJe6Xt1rlGtauXVuBftnHrexhIN3Tbu1VVvuG6+BS48qQGjg1VL4
	ChWPMYQHDOKXQqY7iRRyEU6/MdgjI8Tsmazyce+mgCq8yBePOTRxAJrgmJo7p4Hah1mQsgkLDuF
	xhHjDmEB2uLPraT1x/ji2Mb1GWpSbLodMwO109AxosY9V81/+W02SrqjERuG68FnzVSaLK4OC31
	dOkZl32QchhuZw/6KmF0TOJf+XJ/5Cc+8WigPRUWZU81IA/ZocxMtZ8jVLhkpx+ZNcZDkcs8rED
	ddLp08bCFWfy7cM0Ny/jfPCKf8w6vKbkyjJ4M1wlxg+KCELdnGn3B
X-Received: by 2002:a05:701b:424d:20b0:146:ffa9:2117 with SMTP id
 a92af1059eb24-14f5aa4188fmr24322303c88.1.1791231296682; Mon, 05 Oct 2026
 13:14:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 5 Oct 2026 16:14:45 -0400
X-Gm-Features: AclHuK_EZlkeYKVOf5yOf2obDYc8_quHkQ2koc09s-PajMO3v5D25hjL-FV-od4
Message-ID: <CADnq5_MO+ZNOzW+_EH+gUYZ27X_ggWJJ0XdK6m2QW53m_ThtUQ@mail.gmail.com>
Subject: GPU initialization failure with kernel 7.3
To: Linux regressions mailing list <regressions@lists.linux.dev>, Linux PCI <linux-pci@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lukas Wunner <lukas@wunner.de>
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>, 
	Christian Koenig <christian.koenig@amd.com>, Vitaly Prosyak <vitaly.prosyak@amd.com>, 
	"Deucher, Alexander" <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="UTF-8"

Hi Lukas,

The following commit causes GPUs to fail to initialize on a number of
our servers:
eddba19b8b5f ("PCI/AER: Support Advisory Non-Fatal Errors")
The change reverts cleanly and the GPUs initialize fine with it
reverted.  I've filed a kernel bug to track this:
https://bugzilla.kernel.org/show_bug.cgi?id=222095
Happy to test patches, etc.

Thanks,

Alex
