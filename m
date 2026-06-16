Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5CC47B435
	for <regressions@lists.linux.dev>; Tue, 16 Jun 2026 18:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781636088; cv=pass; b=d11ZH7o+SH/2cYAdLIL0bo3wFp7ygIDkGgQFC19vcpBkJnfYabtBhOhOMUaQzmblyRVFO/5+xwbk1VitAl+rYTq3at95vEO367uI9lKDiX6iRlO40gTolcCrqtayiK3JkkSdGciGi2Jjf45CBe55sLaTaRSE1CKR7OQ57CDhUyw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781636088; c=relaxed/simple;
	bh=t5rv3SdG7+S7uEuSR6RT+I/PPMa/4tgLkyRZEbA+g/8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oQfOWKb6iFKmH2YiALP0oslPBe9p356jPboGbr1UO0R3Tt+vde3CMSDX78NL6LeibyvHLstlBMR96X58X6Zal/S6N/yguaYmESZFIX6IqsWoQgTRFS7NHpSDP4nR6o7hp3cvFfQDndYMD3TD1QKh4zv+JxYlGG5BHuuF4Z8Oms4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aohNwX5W; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aohNwX5W"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-304d3d3d8f8so614372eec.2
        for <regressions@lists.linux.dev>; Tue, 16 Jun 2026 11:54:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781636086; cv=none;
        d=google.com; s=arc-20240605;
        b=ao+YVl8ik1Prn8bBNt/EIXyHMJRf+WqEwj8q4k3FSNnHTe5K1SjYCDl3GoL9W7KwNw
         PElftN7Yn5K+hHi//Ya7te+0JQ9yjC6WMcHe+m2EXZ36lGNLxM3ixeLm+hMqpi4lq3CD
         ITr3NYU1WWkc6f6+2lt6BnqXg3M6li7bFWQGlShzFheOaep9bi6saMUIPFgbj1W99zcW
         B5ENeczpLKMU2iyj4Ro1lDgS2+4w0pOKqLBgqE/WgrJ6GhdzdQAC4sQnJs5CHweuiYmj
         zaGElpKrTiQjudk0+Af7iav+ro6/yF0EPNKrDzjJJzfVP6gDxwBSfxWnsSA2Sne1CEYD
         yW3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MCOSiee7KXjPkCFlHhQFxxSs4KWMyl8PnWZ0V0RhntI=;
        fh=UUMANgy09801LM3ZnK09mMrZo/OQVGqPg3ubh8ceK84=;
        b=JFJLAVsi67Ji5J31aV/nMbznMsWPFXtZgHaj1pnBo/+Y2Mw7f1houPdK4vVvwwfkWx
         dt8fqyKL5VpB2RwW7PuRgTGia9PNMRemfJJoUdx3hciQvbtoa/xVgWZXf2Tz3uAmt4JE
         ohMnlzSo6hXLfipLb+7hBsaQWlubEWdRjd/SVjLvcJdCkvL6HbzTMVCl0LlYESmTC6OF
         7u53cfn17slJflqFC/iiwodE1ztblmZG2Rzlu40aWkty20t7a476Bf0th7NIT7FmDMJL
         odMYD4fhldHNeQnyoHR/RZ9VeJ0D1qeVCkWsE00ESlQvTQPixPigTYGv5k0M+yPBfVeq
         IYuw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781636086; x=1782240886; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MCOSiee7KXjPkCFlHhQFxxSs4KWMyl8PnWZ0V0RhntI=;
        b=aohNwX5WDdFwgyYgzia5UTVBB4lJpsNyzUvnJC+wiJocAOkyTJpEA2Bzo1iIrfjOkk
         vVDCbptMfVTO9DYDvIIfngQKHIzg9g75iC8PjRHnF9enK7qNBPsx+DOXn9xdWVK7KeUR
         xeO9k8hKgVRCjRxFEto1eWLi5rjJxQub+vDlJA/NCl8375VaDPJrzZrHKIrlQGu8hL7D
         1ePJsshQixVmihdtnEIByN6s1XQOmnu6tJfs0ABPdZoQ4zad/aeBKAnOcANsZH9Q4uRQ
         PzqDIhwN/gt17aEPHcPw9qciio/s+iuSN0bbV+UaTRjzPj31rP0C9sJ0gHSHZkIEbcj/
         qwvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781636086; x=1782240886;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MCOSiee7KXjPkCFlHhQFxxSs4KWMyl8PnWZ0V0RhntI=;
        b=IcWuwMuFhxpqPy0ao5wOpjG4O1cRNWaXZ6dbhGMZLKvDgEr6V4TUXiKpqgSIf8RkXz
         MqB94DHTjCn5CRk7fhWCv+/Wicdduyum1Okeofi2ICUPcNiglFFJk0r4f/jwInUgKLjB
         CZUeAWLo8gc9T626CGVQXdisGrC7RlAadfqNfY9pAhZBeiiLpg+xQ7lr31YTTZAXg0w6
         9y5bUT7SrMbE1M4w4S+OsFiPUAnpcLBSceNq3Q0Mv/dVLMtEDnnbHjkQkEiOAO8GO1w7
         EudKKWDoDuMuPNKwKGtRfrqpuGavDnRfe1RqRv2gz4vo0B7q3hMIMRpMhZACsgfDb94I
         4jFQ==
X-Forwarded-Encrypted: i=1; AFNElJ8a5yC1YNzz1o8CfuCfFcT7Q0muA6DKOmmzKH6BN4dsMeMqx8Oy9KHOms/UxdewDu1E938R31A7mYla0w==@lists.linux.dev
X-Gm-Message-State: AOJu0YyoGxf7INblMg8ucN5iRYaa/btnr+ZJpQFxlbN/NBrink2chzWB
	zPQUEvVzpyfEzoWTrbbebYYyX93sADNqnuzgmCs+DN9+eHi90cbYdHMWPMRmFgTeNVKxQFRyLPn
	DI5+YHqGji2fgKe836bFG0qM03wsM+Ko=
X-Gm-Gg: Acq92OFvFLllttLSN16W6K2pGkyOHfEV37o4zVo4kiYknAKlcpNxAGDTTbLSyYKj4bV
	hnJeM1MXgCqb0jnr5LQx5nazbTkJryOdUFTxy1Uo9bCbfq1Y5doZmHNNb/8IbasTiVeyF4gY+HO
	h3ToLGNBt8/b+B0IZ5y2M77VYnjyMmz8UMC/sJf6bkPn2IY2LWBtorvCGXbnAiJ2rmEFNs0Twx5
	97xjNi+cOV3ztEGVjzenGoFxlBVvdVfKHb1xZMr3/v3YnMM+qcCUrKn2UWlSJ8IIJ8hhxzSgLU2
	YQIM6cYxa9gPCawV4GNmLbT2ly3ijnQedIYO+zBJsVIpoX9acVtOgG0h6HzE5N1f30MPpw==
X-Received: by 2002:a05:7022:6981:b0:138:3432:4f6 with SMTP id
 a92af1059eb24-1398f6c603emr40953c88.6.1781636086410; Tue, 16 Jun 2026
 11:54:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260616091050.110064-1-geschw@pm.me> <20260616105553.13062-1-geschw@pm.me>
In-Reply-To: <20260616105553.13062-1-geschw@pm.me>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 16 Jun 2026 14:54:35 -0400
X-Gm-Features: AVVi8CcMitJrUy-JihCbkDqEzdH6bqLbZvkER3aP95k0NiRN5BGB7OhOK604isU
Message-ID: <CADnq5_PV0BF9RkrG7ZN-OBOr2YQ=TdtvknkuDpBnwqswLNiZBg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/amdkfd: Use exclusive bounds for SVM split
 alignment checks
To: Gerhard Schwanzer <geschw@pm.me>
Cc: amd-gfx@lists.freedesktop.org, Felix Kuehling <Felix.Kuehling@amd.com>, 
	Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Xiaogang Chen <xiaogang.chen@amd.com>, Philip Yang <Philip.Yang@amd.com>, regressions@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 16, 2026 at 6:56=E2=80=AFAM Gerhard Schwanzer <geschw@pm.me> wr=
ote:
>
> SVM ranges use inclusive page indices: prange->last is the last page in
> the range. The split-remap logic introduced by commit 448ee45353ef
> ("drm/amdkfd: Use huge page size to check split svm range alignment")
> uses ALIGN_DOWN(prange->last, 512) to determine whether the original
> range can contain a 2MB huge-page mapping.
>
> That aligns the last page itself down. Thus a range ending one page
> before the next 2MB boundary is classified as if the final 2MB block did
> not exist. When such a range is split inside that final block, the
> split head or tail can be left off the remap list even though it was
> derived from an original range that may have PMD mappings.
>
> Use prange->last + 1 as the exclusive upper bound when computing the
> original range's last 2MB-aligned boundary. Then use the actual split
> boundary for the head and tail alignment checks: tail->start for a tail
> split, and new_start for a head split. new_start is equivalent to
> head->last + 1 and directly names the exclusive end of the split head.
>
> Using head->last for the head-side check can both remap a head that ends
> exactly one page before a 2MB boundary and miss a head whose split
> boundary is one page after such a boundary. Philip Yang pointed out in
> the review of the original change that this condition should use
> head->last + 1 or new_start.
>
> Xiaogang Chen identified the inclusive-last cause and posted the
> candidate fix in the regression thread. With the culprit change active
> and the local revert not applied, the unchanged C/HSA reproducer
> completes 10/10 runs with this change on an RX 7600 XT.
>
> Fixes: 448ee45353ef ("drm/amdkfd: Use huge page size to check split svm r=
ange alignment")
> Cc: stable@vger.kernel.org
> Closes: https://gitlab.freedesktop.org/drm/amd/-/work_items/4914
> Link: https://lore.kernel.org/stable/IA1PR12MB85172F7FE9157C092EDA46A0E31=
12@IA1PR12MB8517.namprd12.prod.outlook.com/
> Link: https://lore.kernel.org/all/32ce2b72-aa16-4202-9f99-92e3cd4408bc@am=
d.com/
> Suggested-by: Xiaogang Chen <xiaogang.chen@amd.com>
> Signed-off-by: Gerhard Schwanzer <geschw@pm.me>

Sorry, I missed this patch earlier.
Acked-by: Alex Deucher <alexander.deucher@amd.com>

Applied.  thanks.

Alex

> ---
> Changes in v2:
> - Use new_start for the head-side split-boundary checks, matching Philip
>   Yang's original v4 review guidance and avoiding aligned-head false
>   positives / unaligned-head false negatives.
> - Keep the tail-side last + 1 exclusive-bound fix from Xiaogang's public
>   candidate, which fixes the reproduced RX 7600 XT SDMA0 fault.
>
>  drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/a=
mdkfd/kfd_svm.c
> index 72cfb4a..59b15d5 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> @@ -1144,7 +1144,7 @@ static int
>  svm_range_split_tail(struct svm_range *prange, uint64_t new_last,
>                      struct list_head *insert_list, struct list_head *rem=
ap_list)
>  {
> -       unsigned long last_align_down =3D ALIGN_DOWN(prange->last, 512);
> +       unsigned long last_align_down =3D ALIGN_DOWN(prange->last + 1, 51=
2);
>         unsigned long start_align =3D ALIGN(prange->start, 512);
>         bool huge_page_mapping =3D last_align_down > start_align;
>         struct svm_range *tail =3D NULL;
> @@ -1168,7 +1168,7 @@ static int
>  svm_range_split_head(struct svm_range *prange, uint64_t new_start,
>                      struct list_head *insert_list, struct list_head *rem=
ap_list)
>  {
> -       unsigned long last_align_down =3D ALIGN_DOWN(prange->last, 512);
> +       unsigned long last_align_down =3D ALIGN_DOWN(prange->last + 1, 51=
2);
>         unsigned long start_align =3D ALIGN(prange->start, 512);
>         bool huge_page_mapping =3D last_align_down > start_align;
>         struct svm_range *head =3D NULL;
> @@ -1181,8 +1181,8 @@ svm_range_split_head(struct svm_range *prange, uint=
64_t new_start,
>
>         list_add(&head->list, insert_list);
>
> -       if (huge_page_mapping && head->last + 1 > start_align &&
> -           head->last + 1 < last_align_down && (!IS_ALIGNED(head->last, =
512)))
> +       if (huge_page_mapping && new_start > start_align &&
> +           new_start < last_align_down && !IS_ALIGNED(new_start, 512))
>                 list_add(&head->update_list, remap_list);
>
>         return 0;
>
> base-commit: 2c7d5b0a5ec0fc713a7f350806553643e87e6f43
> --
> 2.54.0
>
>
