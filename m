Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53AF2A3B
	for <regressions@lists.linux.dev>; Fri, 23 Jun 2023 06:08:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59347C433C9;
	Fri, 23 Jun 2023 06:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1687500518;
	bh=iEBo0nryUklKbwszNwaFOULRadSZTxMhgHNcODezBMU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=x8Vknzt0okM+8asd67EscMHeT04682pksCtlyF2tSNbUlnx+oXuvDIF9JUVF3YsQu
	 NvcOX40u7NAeTmaRq1/aLKec3VHu7EXX7fbmwuCfvdEyVd/QtIssbHKZHGIfj4De++
	 qe8u7RD1ZMgXTieEaksCDl+Fk+xk7dhrPGIG7y/Q=
Date: Fri, 23 Jun 2023 08:08:35 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: peterhuewe@gmx.de, jarkko@kernel.org, jgg@ziepe.ca,
	linux-integrity@vger.kernel.org, linux-kernel@vger.kernel.org,
	Linux regressions mailing list <regressions@lists.linux.dev>,
	"Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
	Sachin Sant <sachinp@linux.ibm.com>
Subject: Re: [PATCH] tpm: Ensure that tpm chip has ops to check if it's
 defective
Message-ID: <2023062317-daytime-angles-3c5a@gregkh>
References: <20230623030427.908-1-mario.limonciello@amd.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230623030427.908-1-mario.limonciello@amd.com>

On Thu, Jun 22, 2023 at 10:04:27PM -0500, Mario Limonciello wrote:
> The ibmvtpm doesn't have `chip->ops` set, and so trying to check
> if it's a defective AMD fTPM doesn't work.
> 
> Add an extra check to tpm_amd_is_rng_defective() to ensure the
> TPM being checked has `chip->ops`.
> 
> Cc: Linux regressions mailing list <regressions@lists.linux.dev>
> Reported-by: Aneesh Kumar K. V <aneesh.kumar@linux.ibm.com>
> Reported-by: Sachin Sant <sachinp@linux.ibm.com>
> Link: https://lore.kernel.org/lkml/99B81401-DB46-49B9-B321-CF832B50CAC3@linux.ibm.com/
> Tested-by: Sachin Sant <sachinp@linux.ibm.com>
> Fixes: bd8621ca1510 ("tpm: Add !tpm_amd_is_rng_defective() to the hwrng_unregister() call site")
> Fixes: f1324bbc4011 ("tpm: disable hwrng for fTPM on some AMD designs")
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>  drivers/char/tpm/tpm-chip.c | 3 +++
>  1 file changed, 3 insertions(+)

No cc: stable on that list above?

greg k-h
