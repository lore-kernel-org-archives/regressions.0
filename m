Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5F91079C
	for <regressions@lists.linux.dev>; Fri, 30 Jun 2023 10:07:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90BE5C433C0;
	Fri, 30 Jun 2023 10:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688119625;
	bh=dRTq5GwVmzPLKyaKbw23kgA98h3wm06ktUQGye1ZKaY=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=fOtZKOvDVMoHj53Mx+Gy2LoFyyPmdIwT32O71yXb2Ehtqebk+gPyiRV5jGGGYA1fM
	 vQBd/9NbGQVNmfCHFMxjVqzdd4+YKiLVOe2YDTuVToChdJa4HXCu2m9DsqTDouCRVy
	 KwwiPbZYx/iOnVzdS0R8CNDFA+x1AbUpElvJhZBOYQzF3UKU7vpZIiZrBz11yx2ulK
	 e9AA85m24IfeJO3WDJ1DXlEFCTOvZ2ZrUqRd8GxdH8DmYcedTRr1+Nuo+hyYRM06Ma
	 JsCJxVVICp+CZDck9Xgcy+EQeeW0kz1eHEJoElv9WJQdqklenA15EtRRxV8T4HMPmb
	 CW7GkzK+xY3sg==
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 30 Jun 2023 13:07:00 +0300
Message-Id: <CTPWGNGECE0A.7MSU6S60YWDK@suppilovahvero>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, "Jason Gunthorpe"
 <jgg@ziepe.ca>, "Peter Huewe" <peterhuewe@gmx.de>,
 <stable@vger.kernel.org>, "Linux regressions mailing list"
 <regressions@lists.linux.dev>, "Mario Limonciello"
 <mario.limonciello@amd.com>, "Aneesh Kumar K . V"
 <aneesh.kumar@linux.ibm.com>, "Sachin Sant" <sachinp@linux.ibm.com>
Subject: Re: [PATCH] tpm: return false from tpm_amd_is_rng_defective on
 non-x86 platforms
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Jerry Snitselaar" <jsnitsel@redhat.com>,
 <linux-kernel@vger.kernel.org>, <linux-integrity@vger.kernel.org>
X-Mailer: aerc 0.14.0
References: <20230629204147.1852823-1-jsnitsel@redhat.com>
In-Reply-To: <20230629204147.1852823-1-jsnitsel@redhat.com>

On Thu Jun 29, 2023 at 11:41 PM EEST, Jerry Snitselaar wrote:
> tpm_amd_is_rng_defective is for dealing with an issue related to the
> AMD firmware TPM, so on non-x86 architectures just have it inline and
> return false.
>
> Cc: Jarkko Sakkinen <jarkko@kernel.org>
> Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>
> Cc: Jason Gunthorpe <jgg@ziepe.ca>
> Cc: Peter Huewe <peterhuewe@gmx.de>
> Cc: stable@vger.kernel.org
> Cc: Linux regressions mailing list <regressions@lists.linux.dev>
> Cc: Mario Limonciello <mario.limonciello@amd.com>
> Reported-by: Aneesh Kumar K. V <aneesh.kumar@linux.ibm.com>
> Reported-by: Sachin Sant <sachinp@linux.ibm.com>
> Closes: https://lore.kernel.org/lkml/99B81401-DB46-49B9-B321-CF832B50CAC3=
@linux.ibm.com/
> Fixes: f1324bbc4011 ("tpm: disable hwrng for fTPM on some AMD designs")
> Signed-off-by: Jerry Snitselaar <jsnitsel@redhat.com>
> ---
>  drivers/char/tpm/tpm-chip.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/char/tpm/tpm-chip.c b/drivers/char/tpm/tpm-chip.c
> index cd48033b804a..cf5499e51999 100644
> --- a/drivers/char/tpm/tpm-chip.c
> +++ b/drivers/char/tpm/tpm-chip.c
> @@ -518,6 +518,7 @@ static int tpm_add_legacy_sysfs(struct tpm_chip *chip=
)
>   * 6.x.y.z series: 6.0.18.6 +
>   * 3.x.y.z series: 3.57.y.5 +
>   */
> +#ifdef CONFIG_X86
>  static bool tpm_amd_is_rng_defective(struct tpm_chip *chip)
>  {
>  	u32 val1, val2;
> @@ -566,6 +567,12 @@ static bool tpm_amd_is_rng_defective(struct tpm_chip=
 *chip)
> =20
>  	return true;
>  }
> +#else
> +static inline bool tpm_amd_is_rng_defective(struct tpm_chip *chip)
> +{
> +	return false;
> +}
> +#endif /* CONFIG_X86 */
> =20
>  static int tpm_hwrng_read(struct hwrng *rng, void *data, size_t max, boo=
l wait)
>  {
> --=20
> 2.38.1

Sanity check, this was the right patch, right?

I'll apply it.

BR, Jarkko
